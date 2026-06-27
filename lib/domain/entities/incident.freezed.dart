// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Incident {

 String get id; String get title; String? get description; String get ownerProfileId; IncidentType get type;/// The current status of the incident.
/// This might be calculated dynamically in the WorkflowEngine.
 IncidentStatus get status; List<String> get tags;/// IDs of other incidents related to this one.
/// e.g. Car Accident -> Car Repair
 List<String> get linkedIncidentIds; DateTime get created; DateTime get updated;/// The type of workflow this incident follows (e.g. "MedicalWorkflow", "InvoiceWorkflow").
 String get workflowType;/// Flexible metadata for type-specific fields.
/// e.g. { "doctor_name": "Dr. Smith" }
 Map<String, dynamic> get metadata;
/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentCopyWith<Incident> get copyWith => _$IncidentCopyWithImpl<Incident>(this as Incident, _$identity);

  /// Serializes this Incident to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerProfileId, ownerProfileId) || other.ownerProfileId == ownerProfileId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.linkedIncidentIds, linkedIncidentIds)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.workflowType, workflowType) || other.workflowType == workflowType)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,ownerProfileId,type,status,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(linkedIncidentIds),created,updated,workflowType,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'Incident(id: $id, title: $title, description: $description, ownerProfileId: $ownerProfileId, type: $type, status: $status, tags: $tags, linkedIncidentIds: $linkedIncidentIds, created: $created, updated: $updated, workflowType: $workflowType, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $IncidentCopyWith<$Res>  {
  factory $IncidentCopyWith(Incident value, $Res Function(Incident) _then) = _$IncidentCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String ownerProfileId, IncidentType type, IncidentStatus status, List<String> tags, List<String> linkedIncidentIds, DateTime created, DateTime updated, String workflowType, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$IncidentCopyWithImpl<$Res>
    implements $IncidentCopyWith<$Res> {
  _$IncidentCopyWithImpl(this._self, this._then);

  final Incident _self;
  final $Res Function(Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? ownerProfileId = null,Object? type = null,Object? status = null,Object? tags = null,Object? linkedIncidentIds = null,Object? created = null,Object? updated = null,Object? workflowType = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,ownerProfileId: null == ownerProfileId ? _self.ownerProfileId : ownerProfileId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,linkedIncidentIds: null == linkedIncidentIds ? _self.linkedIncidentIds : linkedIncidentIds // ignore: cast_nullable_to_non_nullable
as List<String>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime,workflowType: null == workflowType ? _self.workflowType : workflowType // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Incident].
extension IncidentPatterns on Incident {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Incident value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Incident value)  $default,){
final _that = this;
switch (_that) {
case _Incident():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Incident value)?  $default,){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String ownerProfileId,  IncidentType type,  IncidentStatus status,  List<String> tags,  List<String> linkedIncidentIds,  DateTime created,  DateTime updated,  String workflowType,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.ownerProfileId,_that.type,_that.status,_that.tags,_that.linkedIncidentIds,_that.created,_that.updated,_that.workflowType,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String ownerProfileId,  IncidentType type,  IncidentStatus status,  List<String> tags,  List<String> linkedIncidentIds,  DateTime created,  DateTime updated,  String workflowType,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Incident():
return $default(_that.id,_that.title,_that.description,_that.ownerProfileId,_that.type,_that.status,_that.tags,_that.linkedIncidentIds,_that.created,_that.updated,_that.workflowType,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String ownerProfileId,  IncidentType type,  IncidentStatus status,  List<String> tags,  List<String> linkedIncidentIds,  DateTime created,  DateTime updated,  String workflowType,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.ownerProfileId,_that.type,_that.status,_that.tags,_that.linkedIncidentIds,_that.created,_that.updated,_that.workflowType,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Incident implements Incident {
  const _Incident({required this.id, required this.title, this.description, required this.ownerProfileId, required this.type, required this.status, final  List<String> tags = const [], final  List<String> linkedIncidentIds = const [], required this.created, required this.updated, required this.workflowType, final  Map<String, dynamic> metadata = const {}}): _tags = tags,_linkedIncidentIds = linkedIncidentIds,_metadata = metadata;
  factory _Incident.fromJson(Map<String, dynamic> json) => _$IncidentFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String ownerProfileId;
@override final  IncidentType type;
/// The current status of the incident.
/// This might be calculated dynamically in the WorkflowEngine.
@override final  IncidentStatus status;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// IDs of other incidents related to this one.
/// e.g. Car Accident -> Car Repair
 final  List<String> _linkedIncidentIds;
/// IDs of other incidents related to this one.
/// e.g. Car Accident -> Car Repair
@override@JsonKey() List<String> get linkedIncidentIds {
  if (_linkedIncidentIds is EqualUnmodifiableListView) return _linkedIncidentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_linkedIncidentIds);
}

@override final  DateTime created;
@override final  DateTime updated;
/// The type of workflow this incident follows (e.g. "MedicalWorkflow", "InvoiceWorkflow").
@override final  String workflowType;
/// Flexible metadata for type-specific fields.
/// e.g. { "doctor_name": "Dr. Smith" }
 final  Map<String, dynamic> _metadata;
/// Flexible metadata for type-specific fields.
/// e.g. { "doctor_name": "Dr. Smith" }
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentCopyWith<_Incident> get copyWith => __$IncidentCopyWithImpl<_Incident>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerProfileId, ownerProfileId) || other.ownerProfileId == ownerProfileId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._linkedIncidentIds, _linkedIncidentIds)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.workflowType, workflowType) || other.workflowType == workflowType)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,ownerProfileId,type,status,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_linkedIncidentIds),created,updated,workflowType,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'Incident(id: $id, title: $title, description: $description, ownerProfileId: $ownerProfileId, type: $type, status: $status, tags: $tags, linkedIncidentIds: $linkedIncidentIds, created: $created, updated: $updated, workflowType: $workflowType, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$IncidentCopyWith<$Res> implements $IncidentCopyWith<$Res> {
  factory _$IncidentCopyWith(_Incident value, $Res Function(_Incident) _then) = __$IncidentCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String ownerProfileId, IncidentType type, IncidentStatus status, List<String> tags, List<String> linkedIncidentIds, DateTime created, DateTime updated, String workflowType, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$IncidentCopyWithImpl<$Res>
    implements _$IncidentCopyWith<$Res> {
  __$IncidentCopyWithImpl(this._self, this._then);

  final _Incident _self;
  final $Res Function(_Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? ownerProfileId = null,Object? type = null,Object? status = null,Object? tags = null,Object? linkedIncidentIds = null,Object? created = null,Object? updated = null,Object? workflowType = null,Object? metadata = null,}) {
  return _then(_Incident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,ownerProfileId: null == ownerProfileId ? _self.ownerProfileId : ownerProfileId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,linkedIncidentIds: null == linkedIncidentIds ? _self._linkedIncidentIds : linkedIncidentIds // ignore: cast_nullable_to_non_nullable
as List<String>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime,updated: null == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime,workflowType: null == workflowType ? _self.workflowType : workflowType // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
