part of 'incident_list_bloc.dart';

@freezed
class IncidentListState with _$IncidentListState {
  const factory IncidentListState.initial() = _Initial;
  const factory IncidentListState.loading() = _Loading;
  const factory IncidentListState.loaded(List<Incident> incidents) = _Loaded;
  const factory IncidentListState.failure(String message) = _Failure;
}
