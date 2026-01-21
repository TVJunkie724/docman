import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';
import 'package:uuid/uuid.dart';

class MedicalWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    // Flexible Workflow: You can jump forward, but rarely backward.
    switch (current) {
      case IncidentStatus.draft:
        return [
          IncidentStatus.scheduled,
          IncidentStatus.attended,
          IncidentStatus.paymentDue,
          IncidentStatus.paid, // Skip everything if already paid
        ];
        
      case IncidentStatus.scheduled:
        return [
          IncidentStatus.attended,
          IncidentStatus.paymentDue,
          IncidentStatus.paid,
          IncidentStatus.closed, // Cancelled
        ];

      case IncidentStatus.attended:
        return [
          IncidentStatus.paymentDue,
          IncidentStatus.paid,
        ];

      case IncidentStatus.paymentDue:
        return [
          IncidentStatus.paid,
        ];

      case IncidentStatus.paid:
        return [
          IncidentStatus.submittedPublic,
          IncidentStatus.reviewRequired, // Skip public if not applicable
          IncidentStatus.closed, // No insurance needed
        ];

      case IncidentStatus.submittedPublic:
        return [
          IncidentStatus.reviewRequired, // Response received
          IncidentStatus.closed,
        ];

      case IncidentStatus.reviewRequired:
        return [
          IncidentStatus.submittedPrivate,
          IncidentStatus.closed, // Decided not to submit
        ];

      case IncidentStatus.submittedPrivate:
        return [
          IncidentStatus.closed,
        ];

      default:
        return [IncidentStatus.closed];
    }
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    final now = DateTime.now();
    switch (status) {
      case IncidentStatus.reviewRequired:
        return [
          Task(
            id: const Uuid().v4(),
            incidentId: incidentId,
            description: "Check Private Insurance Coverage",
            created: now,
          )
        ];
      case IncidentStatus.paymentDue:
         return [
          Task(
            id: const Uuid().v4(),
            incidentId: incidentId,
            description: "Pay Invoice",
            created: now,
          )
        ];
      default:
        return [];
    }
  }
}
