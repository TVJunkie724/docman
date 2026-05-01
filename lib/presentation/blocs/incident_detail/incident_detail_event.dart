part of 'incident_detail_bloc.dart';

@freezed
sealed class IncidentDetailEvent with _$IncidentDetailEvent {
  const factory IncidentDetailEvent.load(String incidentId) =
      LoadIncidentDetail;
  const factory IncidentDetailEvent.documentsUpdated(List<Document> documents) =
      DocumentsUpdated;
  const factory IncidentDetailEvent.updateStatus(IncidentStatus newStatus) =
      UpdateIncidentStatus;
  const factory IncidentDetailEvent.uploadDocument(
    File file,
    Document metadata,
  ) = UploadNewDocument;
}
