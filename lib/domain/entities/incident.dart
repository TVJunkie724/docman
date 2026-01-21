import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'incident.freezed.dart';
part 'incident.g.dart';

@freezed
class Incident with _$Incident {
  const factory Incident({
    required String id,
    required String title,
    String? description,
    required String ownerProfileId,
    required IncidentType type,
    
    /// The current status of the incident.
    /// This might be calculated dynamically in the WorkflowEngine.
    required IncidentStatus status,
    
    @Default([]) List<String> tags,
    
    /// IDs of other incidents related to this one.
    /// e.g. Car Accident -> Car Repair
    @Default([]) List<String> linkedIncidentIds,
    
    required DateTime created,
    required DateTime updated,
    
    /// The type of workflow this incident follows (e.g. "MedicalWorkflow", "InvoiceWorkflow").
    required String workflowType,
    
    /// Flexible metadata for type-specific fields.
    /// e.g. { "doctor_name": "Dr. Smith" }
    @Default({}) Map<String, dynamic> metadata,
  }) = _Incident;

  factory Incident.fromJson(Map<String, dynamic> json) => _$IncidentFromJson(json);
}
