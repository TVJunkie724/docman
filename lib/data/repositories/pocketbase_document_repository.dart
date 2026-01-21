import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';
import '../../domain/entities/document.dart';
import '../../domain/repositories/i_document_repository.dart';

class PocketbaseDocumentRepository implements IDocumentRepository {
  final PocketBase _pb;

  PocketbaseDocumentRepository(this._pb);

  @override
  Stream<List<Document>> watchDocuments(String incidentId) {
    final controller = StreamController<List<Document>>();

    Future<void> fetch() async {
      try {
        final records = await _pb.collection('documents').getFullList(
          filter: 'incidentId = "$incidentId"',
          sort: '-created',
        );
        controller.add(records.map(_mapRecordToDocument).toList());
      } catch (e) {
        controller.addError(e);
      }
    }

    fetch();

    UnsubscribeFunc? unsubscribe;
    controller.onListen = () async {
      unsubscribe = await _pb.collection('documents').subscribe('*', (e) {
        // Filter events for this incident? 
        // PocketBase subscription is collection-wide usually, unless filter is supported in subscribe (it is in newer versions).
        // For now, we just re-fetch if *any* document changes. 
        // Optimization: Check e.record['incidentId'] == incidentId.
        if (e.record != null && e.record!.data['incidentId'] == incidentId) {
           fetch();
        }
      });
    };

    controller.onCancel = () {
      unsubscribe?.call();
    };

    return controller.stream;
  }

  @override
  Future<void> uploadDocument(File file, Document metadata) async {
    // PocketBase expects file uploads as Multipart.
    // The SDK handles this via `files` parameter.
    
    final body = metadata.toJson();
    body.remove('id');
    body.remove('fileUrl'); // Server generates this
    body.remove('created');

    await _pb.collection('documents').create(
      body: body,
      files: [
        http.MultipartFile.fromBytes(
          'file', // The field name in PocketBase
          await file.readAsBytes(),
          filename: file.path.split('/').last,
        ),
      ],
    );
  }

  @override
  Future<void> delete(String documentId) async {
    await _pb.collection('documents').delete(documentId);
  }

  @override
  Future<File> downloadDocument(String documentId, String savePath) async {
    // 1. Get record to find filename
    final record = await _pb.collection('documents').getOne(documentId);
    final filename = record.getStringValue('file');
    
    // 2. Construct URL
    final url = _pb.getFileUrl(record, filename);
    
    // 3. Download
    final response = await http.get(url);
    final file = File(savePath);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  Document _mapRecordToDocument(RecordModel record) {
    final data = record.toJson();
    data['id'] = record.id;
    
    // Construct full file URL
    final filename = record.getStringValue('file');
    if (filename.isNotEmpty) {
      data['fileUrl'] = _pb.getFileUrl(record, filename).toString();
    } else {
      data['fileUrl'] = '';
    }

    return Document.fromJson(data);
  }
}
