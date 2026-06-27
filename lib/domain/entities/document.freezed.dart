// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Document {

 String get id; String get incidentId; String get title; String? get description;/// Who sent this document? e.g. "Spar", "Dr. Smith"
 String? get sender; String get fileUrl; DocumentType get type;/// If this is a new version of an old document, this points to the old one.
 String? get previousVersionId;/// Tracks the version number (v1, v2, etc.)
 int get version;/// Links this document to a specific state in the incident workflow.
/// If null, it is a "General Document".
 IncidentStatus? get incidentStatus;/// True if the document is a draft (scanned/uploaded but not yet finalized/approved).
 bool get isDraft;/// ID of the user who uploaded this document.
 String? get uploaderProfileId; DateTime get created;/// Flexible metadata.
/// e.g. { "amount": 50.00, "is_paid": true }
 Map<String, dynamic> get metadata;
/// Create a copy of Document
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentCopyWith<Document> get copyWith => _$DocumentCopyWithImpl<Document>(this as Document, _$identity);

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Document&&(identical(other.id, id) || other.id == id)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.previousVersionId, previousVersionId) || other.previousVersionId == previousVersionId)&&(identical(other.version, version) || other.version == version)&&(identical(other.incidentStatus, incidentStatus) || other.incidentStatus == incidentStatus)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.uploaderProfileId, uploaderProfileId) || other.uploaderProfileId == uploaderProfileId)&&(identical(other.created, created) || other.created == created)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,incidentId,title,description,sender,fileUrl,type,previousVersionId,version,incidentStatus,isDraft,uploaderProfileId,created,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'Document(id: $id, incidentId: $incidentId, title: $title, description: $description, sender: $sender, fileUrl: $fileUrl, type: $type, previousVersionId: $previousVersionId, version: $version, incidentStatus: $incidentStatus, isDraft: $isDraft, uploaderProfileId: $uploaderProfileId, created: $created, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $DocumentCopyWith<$Res>  {
  factory $DocumentCopyWith(Document value, $Res Function(Document) _then) = _$DocumentCopyWithImpl;
@useResult
$Res call({
 String id, String incidentId, String title, String? description, String? sender, String fileUrl, DocumentType type, String? previousVersionId, int version, IncidentStatus? incidentStatus, bool isDraft, String? uploaderProfileId, DateTime created, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$DocumentCopyWithImpl<$Res>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._self, this._then);

  final Document _self;
  final $Res Function(Document) _then;

/// Create a copy of Document
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? incidentId = null,Object? title = null,Object? description = freezed,Object? sender = freezed,Object? fileUrl = null,Object? type = null,Object? previousVersionId = freezed,Object? version = null,Object? incidentStatus = freezed,Object? isDraft = null,Object? uploaderProfileId = freezed,Object? created = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DocumentType,previousVersionId: freezed == previousVersionId ? _self.previousVersionId : previousVersionId // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,incidentStatus: freezed == incidentStatus ? _self.incidentStatus : incidentStatus // ignore: cast_nullable_to_non_nullable
as IncidentStatus?,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,uploaderProfileId: freezed == uploaderProfileId ? _self.uploaderProfileId : uploaderProfileId // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Document].
extension DocumentPatterns on Document {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Document value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Document() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Document value)  $default,){
final _that = this;
switch (_that) {
case _Document():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Document value)?  $default,){
final _that = this;
switch (_that) {
case _Document() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String incidentId,  String title,  String? description,  String? sender,  String fileUrl,  DocumentType type,  String? previousVersionId,  int version,  IncidentStatus? incidentStatus,  bool isDraft,  String? uploaderProfileId,  DateTime created,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Document() when $default != null:
return $default(_that.id,_that.incidentId,_that.title,_that.description,_that.sender,_that.fileUrl,_that.type,_that.previousVersionId,_that.version,_that.incidentStatus,_that.isDraft,_that.uploaderProfileId,_that.created,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String incidentId,  String title,  String? description,  String? sender,  String fileUrl,  DocumentType type,  String? previousVersionId,  int version,  IncidentStatus? incidentStatus,  bool isDraft,  String? uploaderProfileId,  DateTime created,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Document():
return $default(_that.id,_that.incidentId,_that.title,_that.description,_that.sender,_that.fileUrl,_that.type,_that.previousVersionId,_that.version,_that.incidentStatus,_that.isDraft,_that.uploaderProfileId,_that.created,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String incidentId,  String title,  String? description,  String? sender,  String fileUrl,  DocumentType type,  String? previousVersionId,  int version,  IncidentStatus? incidentStatus,  bool isDraft,  String? uploaderProfileId,  DateTime created,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Document() when $default != null:
return $default(_that.id,_that.incidentId,_that.title,_that.description,_that.sender,_that.fileUrl,_that.type,_that.previousVersionId,_that.version,_that.incidentStatus,_that.isDraft,_that.uploaderProfileId,_that.created,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Document implements Document {
  const _Document({required this.id, required this.incidentId, required this.title, this.description, this.sender, required this.fileUrl, required this.type, this.previousVersionId, this.version = 1, this.incidentStatus, this.isDraft = false, this.uploaderProfileId, required this.created, final  Map<String, dynamic> metadata = const {}}): _metadata = metadata;
  factory _Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

@override final  String id;
@override final  String incidentId;
@override final  String title;
@override final  String? description;
/// Who sent this document? e.g. "Spar", "Dr. Smith"
@override final  String? sender;
@override final  String fileUrl;
@override final  DocumentType type;
/// If this is a new version of an old document, this points to the old one.
@override final  String? previousVersionId;
/// Tracks the version number (v1, v2, etc.)
@override@JsonKey() final  int version;
/// Links this document to a specific state in the incident workflow.
/// If null, it is a "General Document".
@override final  IncidentStatus? incidentStatus;
/// True if the document is a draft (scanned/uploaded but not yet finalized/approved).
@override@JsonKey() final  bool isDraft;
/// ID of the user who uploaded this document.
@override final  String? uploaderProfileId;
@override final  DateTime created;
/// Flexible metadata.
/// e.g. { "amount": 50.00, "is_paid": true }
 final  Map<String, dynamic> _metadata;
/// Flexible metadata.
/// e.g. { "amount": 50.00, "is_paid": true }
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Document
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentCopyWith<_Document> get copyWith => __$DocumentCopyWithImpl<_Document>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Document&&(identical(other.id, id) || other.id == id)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.previousVersionId, previousVersionId) || other.previousVersionId == previousVersionId)&&(identical(other.version, version) || other.version == version)&&(identical(other.incidentStatus, incidentStatus) || other.incidentStatus == incidentStatus)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&(identical(other.uploaderProfileId, uploaderProfileId) || other.uploaderProfileId == uploaderProfileId)&&(identical(other.created, created) || other.created == created)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,incidentId,title,description,sender,fileUrl,type,previousVersionId,version,incidentStatus,isDraft,uploaderProfileId,created,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'Document(id: $id, incidentId: $incidentId, title: $title, description: $description, sender: $sender, fileUrl: $fileUrl, type: $type, previousVersionId: $previousVersionId, version: $version, incidentStatus: $incidentStatus, isDraft: $isDraft, uploaderProfileId: $uploaderProfileId, created: $created, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$DocumentCopyWith<$Res> implements $DocumentCopyWith<$Res> {
  factory _$DocumentCopyWith(_Document value, $Res Function(_Document) _then) = __$DocumentCopyWithImpl;
@override @useResult
$Res call({
 String id, String incidentId, String title, String? description, String? sender, String fileUrl, DocumentType type, String? previousVersionId, int version, IncidentStatus? incidentStatus, bool isDraft, String? uploaderProfileId, DateTime created, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$DocumentCopyWithImpl<$Res>
    implements _$DocumentCopyWith<$Res> {
  __$DocumentCopyWithImpl(this._self, this._then);

  final _Document _self;
  final $Res Function(_Document) _then;

/// Create a copy of Document
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? incidentId = null,Object? title = null,Object? description = freezed,Object? sender = freezed,Object? fileUrl = null,Object? type = null,Object? previousVersionId = freezed,Object? version = null,Object? incidentStatus = freezed,Object? isDraft = null,Object? uploaderProfileId = freezed,Object? created = null,Object? metadata = null,}) {
  return _then(_Document(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DocumentType,previousVersionId: freezed == previousVersionId ? _self.previousVersionId : previousVersionId // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,incidentStatus: freezed == incidentStatus ? _self.incidentStatus : incidentStatus // ignore: cast_nullable_to_non_nullable
as IncidentStatus?,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,uploaderProfileId: freezed == uploaderProfileId ? _self.uploaderProfileId : uploaderProfileId // ignore: cast_nullable_to_non_nullable
as String?,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
