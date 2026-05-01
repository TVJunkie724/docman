import '../entities/incident.dart';
import '../entities/document.dart';
import '../entities/enums.dart';

abstract class IWorkflowEngine {
  /// Calculates the correct status for an incident based on its documents.
  /// e.g. If all invoices are paid, status might become 'Paid'.
  IncidentStatus calculateStatus(Incident incident, List<Document> documents);

  /// Returns a list of available actions for the current state.
  /// e.g. If 'Paid', maybe 'Archive' is available.
  List<String> getAvailableActions(Incident incident);
}
