part of 'incident_detail_bloc.dart';

@freezed
sealed class IncidentDetailState with _$IncidentDetailState {
  const factory IncidentDetailState.initial() = _Initial;
  const factory IncidentDetailState.loading() = _Loading;
  const factory IncidentDetailState.loaded({
    required Incident incident,
    required List<Document> documents,
    required List<IncidentStatus> availableActions,
  }) = _Loaded;
  const factory IncidentDetailState.failure(String message) = _Failure;
}
