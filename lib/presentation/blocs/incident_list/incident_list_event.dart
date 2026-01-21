part of 'incident_list_bloc.dart';

@freezed
class IncidentListEvent with _$IncidentListEvent {
  const factory IncidentListEvent.load(String profileId, {String? tag}) = LoadIncidents;
  const factory IncidentListEvent.updated(List<Incident> incidents) = IncidentsUpdated;
  const factory IncidentListEvent.error(String message) = IncidentsError;
}
