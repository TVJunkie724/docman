import 'dart:convert';
import 'dart:io'; // Added
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/incident.dart';
import '../../domain/entities/document.dart';
import '../../domain/entities/profile.dart';
import 'isar_collections.dart';

class IsarService {
  static late IsarService _instance;
  static IsarService get instance => _instance;

  IsarService._(this.db);

  static Future<void> init(Directory dir) async {
    if (Isar.instanceNames.isEmpty) {
      final isar = await Isar.open(
        [IsarProfileSchema, IsarIncidentSchema, IsarDocumentSchema],
        directory: dir.path,
      );
      _instance = IsarService._(Future.value(isar));
    } else {
      _instance = IsarService._(Future.value(Isar.getInstance()));
    }
  }

  final Future<Isar> db; // Instance field

  // --- Incidents ---

  Future<void> saveIncidents(List<Incident> incidents) async {
    final isar = await db;
    final isarIncidents = incidents.map((e) => IsarIncident()
      ..originalId = e.id
      ..title = e.title
      ..description = e.description
      ..ownerProfileId = e.ownerProfileId
      ..type = e.type
      ..status = e.status
      ..workflowType = e.workflowType // Added
      ..tags = e.tags
      ..linkedIncidentIds = e.linkedIncidentIds
      ..created = e.created
      ..updated = e.updated
      ..metadataJson = jsonEncode(e.metadata)
    ).toList();

    await isar.writeTxn(() async {
      await isar.isarIncidents.putAll(isarIncidents);
    });
  }

  Future<List<Incident>> getIncidents(String profileId) async {
    final isar = await db;
    final records = await isar.isarIncidents
        .filter()
        .ownerProfileIdEqualTo(profileId)
        .sortByCreatedDesc()
        .findAll();

    return records.map((e) => Incident(
      id: e.originalId,
      title: e.title,
      description: e.description,
      ownerProfileId: e.ownerProfileId,
      type: e.type,
      status: e.status,
      workflowType: e.workflowType ?? 'default', // Added with default
      tags: e.tags ?? [],
      linkedIncidentIds: e.linkedIncidentIds ?? [],
      created: e.created,
      updated: e.updated,
      metadata: e.metadataJson != null ? jsonDecode(e.metadataJson!) : {},
    )).toList();
  }

  // --- Documents ---

  Future<void> saveDocuments(List<Document> documents) async {
    final isar = await db;
    final isarDocs = documents.map((e) => IsarDocument()
      ..originalId = e.id
      ..incidentId = e.incidentId
      ..title = e.title
      ..description = e.description
      ..sender = e.sender
      ..fileUrl = e.fileUrl
      ..type = e.type
      ..previousVersionId = e.previousVersionId
      ..incidentStatus = e.incidentStatus // Added
      ..isDraft = e.isDraft // Added
      ..uploaderProfileId = e.uploaderProfileId // Added
      ..version = e.version // Added
      ..created = e.created
      ..metadataJson = jsonEncode(e.metadata)
    ).toList();

    await isar.writeTxn(() async {
      await isar.isarDocuments.putAll(isarDocs);
    });
  }

  Future<List<Document>> getDocuments(String incidentId) async {
    final isar = await db;
    final records = await isar.isarDocuments
        .filter()
        .incidentIdEqualTo(incidentId)
        .sortByCreatedDesc()
        .findAll();

    return records.map((e) => Document(
      id: e.originalId,
      incidentId: e.incidentId,
      title: e.title,
      description: e.description,
      sender: e.sender,
      fileUrl: e.fileUrl,
      type: e.type,
      previousVersionId: e.previousVersionId,
      incidentStatus: e.incidentStatus, // Added
      isDraft: e.isDraft, // Added
      uploaderProfileId: e.uploaderProfileId, // Added
      version: e.version, // Added
      created: e.created,
      metadata: e.metadataJson != null ? jsonDecode(e.metadataJson!) : {},
    )).toList();
  }
}
