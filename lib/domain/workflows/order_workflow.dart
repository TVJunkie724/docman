import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';
import 'package:uuid/uuid.dart';

class OrderWorkflow extends WorkflowDefinition {
  @override
  List<IncidentStatus> getAvailableNextStatuses(IncidentStatus current) {
    // Allow skipping steps (e.g. Draft -> WarrantyActive)
    final commonNext = [
      IncidentStatus.ordered,
      IncidentStatus.shipped,
      IncidentStatus.delivered,
      IncidentStatus.paymentDue,
      IncidentStatus.paid,
      IncidentStatus.warrantyActive,
      IncidentStatus.closed,
    ];

    switch (current) {
      case IncidentStatus.warrantyActive:
        return [
          IncidentStatus.reclamation, // Something broke
          IncidentStatus.closed, // Warranty expired
        ];
        
      case IncidentStatus.reclamation:
        return [
          IncidentStatus.warrantyActive, // Fixed
          IncidentStatus.closed, // Refunded/Replaced
        ];
        
      default:
        return commonNext;
    }
  }

  @override
  List<Task> getTasksForStatus(IncidentStatus status, String incidentId) {
    final now = DateTime.now();
    if (status == IncidentStatus.reclamation) {
      return [
        Task(
          id: const Uuid().v4(),
          incidentId: incidentId,
          description: "Process Return / Repair",
          created: now,
        )
      ];
    }
    return [];
  }
}
