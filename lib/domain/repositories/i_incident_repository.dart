import '../entities/incident.dart';

abstract class IIncidentRepository {
  /// Watch incidents for a specific profile, optionally filtered by tag.
  Stream<List<Incident>> watchIncidents({required String profileId, String? tag});

  /// Get a single incident by ID.
  Future<Incident?> getIncident(String id);

  /// Create or update an incident.
  Future<void> createOrUpdate(Incident incident);

  /// Delete an incident.
  Future<void> delete(String incidentId);
}
