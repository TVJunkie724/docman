import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'document.freezed.dart';
part 'document.g.dart';

@freezed
class Document with _$Document {
  const factory Document({
    required String id,
    required String incidentId,
    required String title,
    String? description,
    
    /// Who sent this document? e.g. "Spar", "Dr. Smith"
    String? sender,
    
    required String fileUrl,
    required DocumentType type,
    
    /// If this is a new version of an old document, this points to the old one.
    String? previousVersionId,
    
    /// Tracks the version number (v1, v2, etc.)
    @Default(1) int version,
    
    /// Links this document to a specific state in the incident workflow.
    /// If null, it is a "General Document".
    IncidentStatus? incidentStatus,
    
    /// True if the document is a draft (scanned/uploaded but not yet finalized/approved).
    @Default(false) bool isDraft,
    
    /// ID of the user who uploaded this document.
    String? uploaderProfileId,
    
    required DateTime created,
    
    /// Flexible metadata.
    /// e.g. { "amount": 50.00, "is_paid": true }
    @Default({}) Map<String, dynamic> metadata,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);
}
