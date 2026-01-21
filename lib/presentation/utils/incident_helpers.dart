import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/entities/enums.dart';

extension IncidentStatusColor on IncidentStatus {
  Color get color {
    switch (this) {
      case IncidentStatus.draft: return Colors.grey;
      case IncidentStatus.open: return Colors.blueGrey;
      
      // Order
      case IncidentStatus.ordered: return Colors.indigo;
      case IncidentStatus.shipped: return Colors.blue;
      case IncidentStatus.delivered: return Colors.green;
      case IncidentStatus.warrantyActive: return Colors.teal;
      case IncidentStatus.reclamation: return Colors.red;
      
      // Insurance
      case IncidentStatus.quote: return Colors.amber;
      case IncidentStatus.cancelled: return Colors.redAccent;
      
      // Education
      case IncidentStatus.readyForReturn: return Colors.orangeAccent;
      
      // Trip
      case IncidentStatus.booked: return Colors.purple;
      case IncidentStatus.duringTrip: return Colors.pink;
      
      // Medical
      case IncidentStatus.scheduled: return Colors.purple;
      case IncidentStatus.attended: return Colors.indigo;
      case IncidentStatus.paymentDue: return Colors.orange;
      case IncidentStatus.paid: return Colors.green;
      case IncidentStatus.submittedPublic: return Colors.teal;
      case IncidentStatus.reviewRequired: return Colors.amber;
      case IncidentStatus.submittedPrivate: return Colors.cyan;
      
      // Generic
      case IncidentStatus.actionRequired: return Colors.red;
      case IncidentStatus.closed: return Colors.black87;
      case IncidentStatus.archived: return Colors.brown;
    }
  }
}

extension IncidentTypeWorkflow on IncidentType {
  List<IncidentStatus> get workflow {
    switch (this) {
      case IncidentType.medical:
        return [
          IncidentStatus.scheduled,
          IncidentStatus.attended,
          IncidentStatus.paymentDue,
          IncidentStatus.paid,
          IncidentStatus.submittedPublic,
          IncidentStatus.submittedPrivate,
          IncidentStatus.closed,
        ];
      case IncidentType.order:
        return [
          IncidentStatus.ordered,
          IncidentStatus.shipped,
          IncidentStatus.delivered,
          IncidentStatus.warrantyActive,
          IncidentStatus.closed,
        ];
      // Add other workflows as needed, defaulting to a generic set
      default:
        return [
          IncidentStatus.open,
          IncidentStatus.actionRequired,
          IncidentStatus.closed,
        ];
    }
  }
}


extension IncidentTypeColor on IncidentType {
  Color get color {
    switch (this) {
      case IncidentType.medical: return Colors.redAccent;
      case IncidentType.order: return Colors.blueAccent;
      case IncidentType.education: return Colors.orangeAccent;
      case IncidentType.trip: return Colors.purpleAccent;
      case IncidentType.insurance: return Colors.green;
      case IncidentType.invoice: return Colors.blueGrey;
      case IncidentType.general: return Colors.grey;
      case IncidentType.personal: return Colors.teal;
    }
  }
  
  IconData get icon {
    switch (this) {
      case IncidentType.medical: return FontAwesomeIcons.userDoctor;
      case IncidentType.order: return FontAwesomeIcons.box;
      case IncidentType.education: return FontAwesomeIcons.graduationCap;
      case IncidentType.trip: return FontAwesomeIcons.plane;
      case IncidentType.insurance: return FontAwesomeIcons.shieldHeart;
      case IncidentType.invoice: return FontAwesomeIcons.fileInvoice;
      case IncidentType.general: return FontAwesomeIcons.file;
      case IncidentType.personal: return FontAwesomeIcons.idCard;
    }
  }
}
