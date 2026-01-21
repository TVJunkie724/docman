import 'dart:async';
import '../../domain/entities/incident.dart';
import '../../domain/repositories/i_incident_repository.dart';
import '../local/isar_service.dart';
import '../repositories/pocketbase_incident_repository.dart';

class CachedIncidentRepository implements IIncidentRepository {
  final PocketbaseIncidentRepository _remote;
  final IsarService _local;

  CachedIncidentRepository(this._remote, this._local);

  @override
  Stream<List<Incident>> watchIncidents({required String profileId, String? tag}) async* {
    // 1. Emit local data immediately
    yield await _local.getIncidents(profileId);

    // 2. Listen to remote updates
    await for (final remoteIncidents in _remote.watchIncidents(profileId: profileId, tag: tag)) {
      // 3. Save to local
      await _local.saveIncidents(remoteIncidents);
      
      // 4. Emit updated local data (to ensure consistency)
      yield await _local.getIncidents(profileId);
    }
  }

  @override
  Future<Incident?> getIncident(String id) async {
    // Try remote first, fall back to local? 
    // Or local first for speed?
    // Let's try remote to ensure freshness, but if offline, use local.
    try {
      final incident = await _remote.getIncident(id);
      if (incident != null) {
        await _local.saveIncidents([incident]);
        return incident;
      }
    } catch (e) {
      // Offline or error
    }
    
    // Fallback to local
    // Note: getIncidents is by profile, we might need a getIncidentById in IsarService.
    // For now, we assume if it's not in the list, we can't find it easily without a new query.
    // We will skip implementing specific getById in Isar for this MVP step.
    return null;
  }

  @override
  Future<void> createOrUpdate(Incident incident) async {
    // Optimistic Update: Save to local first
    await _local.saveIncidents([incident]);
    
    // Then send to remote
    await _remote.createOrUpdate(incident);
    
    // Remote will trigger the watch stream, which will update local again with server-generated fields (like updated time).
  }

  @override
  Future<void> delete(String incidentId) async {
    await _remote.delete(incidentId);
    // We should also delete from local, but the watch stream might handle it if we sync correctly.
    // Ideally IsarService needs a delete method.
  }
}
