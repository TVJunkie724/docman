import '../entities/incident.dart';
import '../entities/task.dart';
import '../entities/enums.dart';

abstract class WorkflowDefinition {
  /// Returns a list of statuses that are valid "Next Steps" from the current status.
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus currentStatus);

  /// Returns a list of Tasks that should be auto-created when entering a specific status.
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId);
  
  /// Validates if a transition is allowed.
  bool canTransition(IncidentStatus current, IncidentStatus next) {
    return getAvailableNextStatuses(current).contains(next);
  }
}
