import 'package:isar/isar.dart';
import '../../domain/entities/enums.dart';

part 'isar_collections.g.dart';

@collection
class IsarProfile {
  Id id = Isar.autoIncrement; // Isar needs an int ID for internal use
  
  @Index(unique: true, replace: true)
  late String originalId; // The PocketBase ID
  
  late String name;
  String? avatarUrl;
  String? linkedUserId;
  List<String>? managers;
  String? passportNumber;
  String? socialSecurityNumber;
  
  // Isar doesn't support Map<String, dynamic> directly.
  // We store it as a JSON string.
  String? metadataJson; 
}

@collection
class IsarIncident {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true, replace: true)
  late String originalId;
  
  late String title;
  String? description;
  late String ownerProfileId;
  
  @Enumerated(EnumType.name)
  late IncidentType type;
  
  @Enumerated(EnumType.name)
  late IncidentStatus status;
  
  String? workflowType; // Added

  List<String>? tags;
  List<String>? linkedIncidentIds;
  
  late DateTime created;
  late DateTime updated;
  
  String? metadataJson;
}

@collection
class IsarDocument {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true, replace: true)
  late String originalId;
  
  @Index()
  late String incidentId;
  
  late String title;
  String? description;
  String? sender;
  late String fileUrl;
  
  @Enumerated(EnumType.name)
  late DocumentType type;
  
  String? previousVersionId;
  
  // Workflow Fields
  @Enumerated(EnumType.name)
  IncidentStatus? incidentStatus; // Added
  
  bool isDraft = false; // Added
  String? uploaderProfileId; // Added
  int version = 1; // Added
  
  late DateTime created;
  
  String? metadataJson;
}
