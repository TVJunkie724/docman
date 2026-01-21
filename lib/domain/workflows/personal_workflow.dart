import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';

class PersonalWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    switch (current) {
      case IncidentStatus.draft:
        return [IncidentStatus.open]; // "Active"
        
      case IncidentStatus.open:
        return [
          IncidentStatus.actionRequired, // e.g. Expiry date approaching
          IncidentStatus.closed, // Moved away / Sold
        ];

      case IncidentStatus.actionRequired:
        return [
          IncidentStatus.open, // Fixed (uploaded new version)
          IncidentStatus.closed,
        ];

      case IncidentStatus.closed:
        return [IncidentStatus.open]; // Re-open if needed

      default:
        return [IncidentStatus.open];
    }
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    // Personal workflow usually doesn't auto-generate tasks 
    // unless we implement expiry date monitoring later.
    return [];
  }
}
