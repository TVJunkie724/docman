import 'package:pocketbase/pocketbase.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/i_profile_repository.dart';

class PocketbaseProfileRepository implements IProfileRepository {
  final PocketBase _pb;

  PocketbaseProfileRepository(this._pb);

  @override
  Future<Profile?> getProfileForUser(String userId) async {
    try {
      // Assuming a 'profiles' collection where 'linkedUserId' matches.
      final records = await _pb.collection('profiles').getList(
        filter: 'linkedUserId = "$userId"',
        perPage: 1,
      );

      if (records.items.isEmpty) return null;
      return _mapRecordToProfile(records.items.first);
    } catch (e) {
      // Handle error or return null
      print("Error fetching profile: $e");
      return null;
    }
  }

  @override
  Future<List<Profile>> getManagedProfiles(String managerProfileId) async {
    try {
      // Assuming 'managers' is a relation field.
      // We filter for profiles where 'managers' contains the given ID.
      final records = await _pb.collection('profiles').getFullList(
        filter: 'managers ~ "$managerProfileId"',
      );

      return records.map(_mapRecordToProfile).toList();
    } catch (e) {
      print("Error fetching managed profiles: $e");
      return [];
    }
  }

  @override
  Future<void> saveProfile(Profile profile) async {
    final body = profile.toJson();
    // Remove ID from body as it's a path param
    body.remove('id'); 
    
    if (profile.id.isEmpty) {
      await _pb.collection('profiles').create(body: body);
    } else {
      await _pb.collection('profiles').update(profile.id, body: body);
    }
  }

  Profile _mapRecordToProfile(RecordModel record) {
    // PocketBase returns a RecordModel. We need to convert it to our Profile.
    // We use the generated .fromJson, but we need to ensure the map structure matches.
    final data = record.toJson();
    
    // Ensure 'id' is present (it usually is in RecordModel)
    data['id'] = record.id;
    
    // Handle 'managers' relation. 
    // If it's expanded, it might be a list of objects. If not, it's a list of IDs.
    // We assume it's a list of IDs here.
    
    return Profile.fromJson(data);
  }
}
