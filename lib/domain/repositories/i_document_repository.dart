import 'dart:io';
import '../entities/document.dart';

abstract class IDocumentRepository {
  /// Watch all documents attached to a specific incident.
  Stream<List<Document>> watchDocuments(String incidentId);

  /// Upload a new document file and create its metadata record.
  Future<void> uploadDocument(File file, Document metadata);

  /// Delete a document.
  Future<void> delete(String documentId);
  
  /// Download a document file to local storage.
  Future<File> downloadDocument(String documentId, String savePath);
}
