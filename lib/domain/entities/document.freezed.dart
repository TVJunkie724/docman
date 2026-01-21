// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String get id => throw _privateConstructorUsedError;
  String get incidentId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Who sent this document? e.g. "Spar", "Dr. Smith"
  String? get sender => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  DocumentType get type => throw _privateConstructorUsedError;

  /// If this is a new version of an old document, this points to the old one.
  String? get previousVersionId => throw _privateConstructorUsedError;

  /// Tracks the version number (v1, v2, etc.)
  int get version => throw _privateConstructorUsedError;

  /// Links this document to a specific state in the incident workflow.
  /// If null, it is a "General Document".
  IncidentStatus? get incidentStatus => throw _privateConstructorUsedError;

  /// True if the document is a draft (scanned/uploaded but not yet finalized/approved).
  bool get isDraft => throw _privateConstructorUsedError;

  /// ID of the user who uploaded this document.
  String? get uploaderProfileId => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  /// Flexible metadata.
  /// e.g. { "amount": 50.00, "is_paid": true }
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call(
      {String id,
      String incidentId,
      String title,
      String? description,
      String? sender,
      String fileUrl,
      DocumentType type,
      String? previousVersionId,
      int version,
      IncidentStatus? incidentStatus,
      bool isDraft,
      String? uploaderProfileId,
      DateTime created,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incidentId = null,
    Object? title = null,
    Object? description = freezed,
    Object? sender = freezed,
    Object? fileUrl = null,
    Object? type = null,
    Object? previousVersionId = freezed,
    Object? version = null,
    Object? incidentStatus = freezed,
    Object? isDraft = null,
    Object? uploaderProfileId = freezed,
    Object? created = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      previousVersionId: freezed == previousVersionId
          ? _value.previousVersionId
          : previousVersionId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      incidentStatus: freezed == incidentStatus
          ? _value.incidentStatus
          : incidentStatus // ignore: cast_nullable_to_non_nullable
              as IncidentStatus?,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      uploaderProfileId: freezed == uploaderProfileId
          ? _value.uploaderProfileId
          : uploaderProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
          _$DocumentImpl value, $Res Function(_$DocumentImpl) then) =
      __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String incidentId,
      String title,
      String? description,
      String? sender,
      String fileUrl,
      DocumentType type,
      String? previousVersionId,
      int version,
      IncidentStatus? incidentStatus,
      bool isDraft,
      String? uploaderProfileId,
      DateTime created,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
      _$DocumentImpl _value, $Res Function(_$DocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incidentId = null,
    Object? title = null,
    Object? description = freezed,
    Object? sender = freezed,
    Object? fileUrl = null,
    Object? type = null,
    Object? previousVersionId = freezed,
    Object? version = null,
    Object? incidentStatus = freezed,
    Object? isDraft = null,
    Object? uploaderProfileId = freezed,
    Object? created = null,
    Object? metadata = null,
  }) {
    return _then(_$DocumentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      previousVersionId: freezed == previousVersionId
          ? _value.previousVersionId
          : previousVersionId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      incidentStatus: freezed == incidentStatus
          ? _value.incidentStatus
          : incidentStatus // ignore: cast_nullable_to_non_nullable
              as IncidentStatus?,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      uploaderProfileId: freezed == uploaderProfileId
          ? _value.uploaderProfileId
          : uploaderProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentImpl implements _Document {
  const _$DocumentImpl(
      {required this.id,
      required this.incidentId,
      required this.title,
      this.description,
      this.sender,
      required this.fileUrl,
      required this.type,
      this.previousVersionId,
      this.version = 1,
      this.incidentStatus,
      this.isDraft = false,
      this.uploaderProfileId,
      required this.created,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String incidentId;
  @override
  final String title;
  @override
  final String? description;

  /// Who sent this document? e.g. "Spar", "Dr. Smith"
  @override
  final String? sender;
  @override
  final String fileUrl;
  @override
  final DocumentType type;

  /// If this is a new version of an old document, this points to the old one.
  @override
  final String? previousVersionId;

  /// Tracks the version number (v1, v2, etc.)
  @override
  @JsonKey()
  final int version;

  /// Links this document to a specific state in the incident workflow.
  /// If null, it is a "General Document".
  @override
  final IncidentStatus? incidentStatus;

  /// True if the document is a draft (scanned/uploaded but not yet finalized/approved).
  @override
  @JsonKey()
  final bool isDraft;

  /// ID of the user who uploaded this document.
  @override
  final String? uploaderProfileId;
  @override
  final DateTime created;

  /// Flexible metadata.
  /// e.g. { "amount": 50.00, "is_paid": true }
  final Map<String, dynamic> _metadata;

  /// Flexible metadata.
  /// e.g. { "amount": 50.00, "is_paid": true }
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Document(id: $id, incidentId: $incidentId, title: $title, description: $description, sender: $sender, fileUrl: $fileUrl, type: $type, previousVersionId: $previousVersionId, version: $version, incidentStatus: $incidentStatus, isDraft: $isDraft, uploaderProfileId: $uploaderProfileId, created: $created, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.previousVersionId, previousVersionId) ||
                other.previousVersionId == previousVersionId) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.incidentStatus, incidentStatus) ||
                other.incidentStatus == incidentStatus) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.uploaderProfileId, uploaderProfileId) ||
                other.uploaderProfileId == uploaderProfileId) &&
            (identical(other.created, created) || other.created == created) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      incidentId,
      title,
      description,
      sender,
      fileUrl,
      type,
      previousVersionId,
      version,
      incidentStatus,
      isDraft,
      uploaderProfileId,
      created,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(
      this,
    );
  }
}

abstract class _Document implements Document {
  const factory _Document(
      {required final String id,
      required final String incidentId,
      required final String title,
      final String? description,
      final String? sender,
      required final String fileUrl,
      required final DocumentType type,
      final String? previousVersionId,
      final int version,
      final IncidentStatus? incidentStatus,
      final bool isDraft,
      final String? uploaderProfileId,
      required final DateTime created,
      final Map<String, dynamic> metadata}) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get incidentId;
  @override
  String get title;
  @override
  String? get description;
  @override

  /// Who sent this document? e.g. "Spar", "Dr. Smith"
  String? get sender;
  @override
  String get fileUrl;
  @override
  DocumentType get type;
  @override

  /// If this is a new version of an old document, this points to the old one.
  String? get previousVersionId;
  @override

  /// Tracks the version number (v1, v2, etc.)
  int get version;
  @override

  /// Links this document to a specific state in the incident workflow.
  /// If null, it is a "General Document".
  IncidentStatus? get incidentStatus;
  @override

  /// True if the document is a draft (scanned/uploaded but not yet finalized/approved).
  bool get isDraft;
  @override

  /// ID of the user who uploaded this document.
  String? get uploaderProfileId;
  @override
  DateTime get created;
  @override

  /// Flexible metadata.
  /// e.g. { "amount": 50.00, "is_paid": true }
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
