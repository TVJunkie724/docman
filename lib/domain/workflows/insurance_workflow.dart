import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';
import 'package:uuid/uuid.dart';

class InsuranceWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    switch (current) {
      case IncidentStatus.draft:
        return [
          IncidentStatus.quote,
          IncidentStatus.open, // Active
        ];
        
      case IncidentStatus.quote:
        return [
          IncidentStatus.open, // Accepted and Active
          IncidentStatus.closed, // Rejected quote
        ];

      case IncidentStatus.open: // Active Policy
        return [
          IncidentStatus.reviewRequired, // Renewal coming up
          IncidentStatus.cancelled,
        ];

      case IncidentStatus.reviewRequired:
        return [
          IncidentStatus.open, // Renewed
          IncidentStatus.cancelled, // Cancelled
        ];

      case IncidentStatus.cancelled:
        return [
          IncidentStatus.open, // Re-activated (rare)
        ];

      default:
        return [IncidentStatus.open];
    }
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    final now = DateTime.now();
    if (status == IncidentStatus.reviewRequired) {
      return [
        Task(
          id: const Uuid().v4(),
          incidentId: incidentId,
          description: "Review Policy Renewal / Check Alternatives",
          created: now,
        )
      ];
    }
    return [];
  }
}
