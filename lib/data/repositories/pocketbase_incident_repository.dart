import 'dart:async';
import 'package:pocketbase/pocketbase.dart';
import '../../domain/entities/incident.dart';
import '../../domain/repositories/i_incident_repository.dart';

class PocketbaseIncidentRepository implements IIncidentRepository {
  final PocketBase _pb;

  PocketbaseIncidentRepository(this._pb);

  @override
  Stream<List<Incident>> watchIncidents({required String profileId, String? tag}) {
    // 1. Initial Fetch
    final controller = StreamController<List<Incident>>();
    
    Future<void> fetch() async {
      try {
        String filter = 'ownerProfileId = "$profileId"';
        if (tag != null) {
          filter += ' && tags ~ "$tag"';
        }
        
        final records = await _pb.collection('incidents').getFullList(
          filter: filter,
          sort: '-created',
        );
        controller.add(records.map(_mapRecordToIncident).toList());
      } catch (e) {
        controller.addError(e);
      }
    }
    
    fetch();

    // 2. Real-time Subscription
    // Note: PocketBase 'subscribe' returns a function to unsubscribe.
    // We should handle this in onCancel.
    UnsubscribeFunc? unsubscribe;
    
    controller.onListen = () async {
      unsubscribe = await _pb.collection('incidents').subscribe('*', (e) {
        // When any change happens, we re-fetch the whole list for simplicity
        // In a production app, we might update the list locally.
        fetch();
      });
    };

    controller.onCancel = () {
      unsubscribe?.call();
    };

    return controller.stream;
  }

  @override
  Future<Incident?> getIncident(String id) async {
    try {
      final record = await _pb.collection('incidents').getOne(id);
      return _mapRecordToIncident(record);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> createOrUpdate(Incident incident) async {
    final body = incident.toJson();
    body.remove('id');
    body.remove('created'); // Let server handle created
    body.remove('updated'); // Let server handle updated

    if (incident.id.isEmpty) {
      await _pb.collection('incidents').create(body: body);
    } else {
      await _pb.collection('incidents').update(incident.id, body: body);
    }
  }

  @override
  Future<void> delete(String incidentId) async {
    await _pb.collection('incidents').delete(incidentId);
  }

  Incident _mapRecordToIncident(RecordModel record) {
    final data = record.toJson();
    data['id'] = record.id;
    // Ensure dates are parsed correctly if needed, but Freezed handles standard ISO strings.
    return Incident.fromJson(data);
  }
}
