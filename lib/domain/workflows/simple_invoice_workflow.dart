import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';

class SimpleInvoiceWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    // Extremely flexible. You can basically go anywhere.
    return [
      IncidentStatus.paymentDue,
      IncidentStatus.paid,
      IncidentStatus.closed,
    ];
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    if (status == IncidentStatus.paymentDue) {
      return [
        Task(
          id: "auto_pay_$incidentId", // simplified ID generation
          incidentId: incidentId,
          description: "Pay Invoice",
          created: DateTime.now(),
        )
      ];
    }
    return [];
  }
}
