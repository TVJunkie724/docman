import 'dart:async';
import 'dart:io';
import '../../domain/entities/document.dart';
import '../../domain/repositories/i_document_repository.dart';
import '../local/isar_service.dart';
import '../repositories/pocketbase_document_repository.dart';

class CachedDocumentRepository implements IDocumentRepository {
  final PocketbaseDocumentRepository _remote;
  final IsarService _local;

  CachedDocumentRepository(this._remote, this._local);

  @override
  Stream<List<Document>> watchDocuments(String incidentId) async* {
    // 1. Emit local
    yield await _local.getDocuments(incidentId);

    // 2. Listen to remote
    await for (final remoteDocs in _remote.watchDocuments(incidentId)) {
      // 3. Save to local
      await _local.saveDocuments(remoteDocs);
      
      // 4. Emit updated
      yield await _local.getDocuments(incidentId);
    }
  }

  @override
  Future<void> uploadDocument(File file, Document metadata) async {
    // No optimistic update for files usually, as we need the server URL.
    await _remote.uploadDocument(file, metadata);
  }

  @override
  Future<void> delete(String documentId) async {
    await _remote.delete(documentId);
  }

  @override
  Future<File> downloadDocument(String documentId, String savePath) {
    // We could cache the file itself, but for now just pass through.
    return _remote.downloadDocument(documentId, savePath);
  }
}
