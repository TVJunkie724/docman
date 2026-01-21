import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';

class TripWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    final commonNext = [
      IncidentStatus.booked,
      IncidentStatus.duringTrip,
      IncidentStatus.closed,
    ];

    switch (current) {
      case IncidentStatus.draft:
        return [
          IncidentStatus.open,
          ...commonNext,
        ];
        
      case IncidentStatus.open:
        return commonNext;

      case IncidentStatus.booked:
        return [
          IncidentStatus.duringTrip,
          IncidentStatus.closed, // Cancelled or Done
        ];

      case IncidentStatus.duringTrip:
        return [
          IncidentStatus.closed,
        ];

      default:
        return [IncidentStatus.closed];
    }
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    return [];
  }
}
