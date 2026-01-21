import '../entities/incident.dart';
import '../entities/document.dart';
import '../entities/enums.dart';
import '../entities/task.dart';
import 'workflow_definition.dart';
import 'medical_workflow.dart';
import 'simple_invoice_workflow.dart';
import 'order_workflow.dart';
import 'insurance_workflow.dart';
import 'education_workflow.dart';
import 'trip_workflow.dart';
import 'personal_workflow.dart';

class WorkflowEngine {
  // Singleton or Factory pattern could be used here.
  // For now, simple stateless logic.

  WorkflowDefinition _getWorkflowForType(IncidentType type) {
    switch (type) {
      case IncidentType.medical:
        return MedicalWorkflow();
      case IncidentType.invoice:
        return SimpleInvoiceWorkflow();
      case IncidentType.order:
        return OrderWorkflow();
      case IncidentType.insurance:
        return InsuranceWorkflow();
      case IncidentType.education:
        return EducationWorkflow();
      case IncidentType.trip:
        return TripWorkflow();
      case IncidentType.personal:
        return PersonalWorkflow();
      default:
        // Fallback for generic types
        return SimpleInvoiceWorkflow(); 
    }
  }

  /// Returns the list of available next statuses for a given incident.
  List<IncidentStatus> getAvailableNextStatuses(Incident incident) {
    final workflow = _getWorkflowForType(incident.type);
    return workflow.getAvailableNextStatuses(incident.status);
  }

  /// Returns any tasks that should be auto-created when entering this status.
  List<Task> getTasksForNewStatus(Incident incident, IncidentStatus newStatus) {
    final workflow = _getWorkflowForType(incident.type);
    return workflow.getTasksForStatus(newStatus, incident.id);
  }
  
  /// Calculates if the status should change based on document updates.
  /// e.g. If a new Invoice is added to a 'Paid' incident, maybe revert to 'PaymentDue'.
  IncidentStatus calculateStatus(Incident incident, List<Document> documents) {
    // This logic can be expanded. 
    // For now, we trust the manual status, but this is where the "Brain" lives.
    
    // Example Logic:
    // if (incident.type == IncidentType.invoice && incident.status == IncidentStatus.paid) {
    //   bool hasUnpaidInvoice = documents.any((d) => d.type == DocumentType.invoice && d.metadata['is_paid'] == false);
    //   if (hasUnpaidInvoice) return IncidentStatus.paymentDue;
    // }
    
    return incident.status;
  }
}
