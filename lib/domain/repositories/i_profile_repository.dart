import '../entities/profile.dart';

abstract class IProfileRepository {
  /// Get the main profile linked to the specific User ID.
  Future<Profile?> getProfileForUser(String userId);

  /// Get all profiles managed by the given Profile ID.
  /// e.g. If I am "Dad", get "Timmy" and "Sarah".
  Future<List<Profile>> getManagedProfiles(String managerProfileId);
  
  /// Create or update a profile.
  Future<void> saveProfile(Profile profile);
}
