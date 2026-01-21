import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';

class EducationWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    // Maximum flexibility: You can always just close it if you did it offline.
    final commonNext = [
      IncidentStatus.actionRequired, // Parent needs to sign/pay
      IncidentStatus.readyForReturn, // In backpack
      IncidentStatus.submittedPublic, // Teacher has it (reusing 'submittedPublic' or generic 'closed')
      IncidentStatus.closed,
    ];

    switch (current) {
      case IncidentStatus.draft:
        return [
          IncidentStatus.open, // Received
          ...commonNext,
        ];
        
      case IncidentStatus.open: // Received
        return commonNext;

      case IncidentStatus.actionRequired:
        return [
          IncidentStatus.readyForReturn, // Signed
          IncidentStatus.closed, // Done
        ];

      case IncidentStatus.readyForReturn:
        return [
          IncidentStatus.closed, // Submitted
        ];

      default:
        return [IncidentStatus.closed];
    }
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    // No auto-tasks for now, usually the Incident Title itself is the task.
    return [];
  }
}
