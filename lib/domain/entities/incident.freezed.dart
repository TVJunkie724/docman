// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Incident _$IncidentFromJson(Map<String, dynamic> json) {
  return _Incident.fromJson(json);
}

/// @nodoc
mixin _$Incident {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get ownerProfileId => throw _privateConstructorUsedError;
  IncidentType get type => throw _privateConstructorUsedError;

  /// The current status of the incident.
  /// This might be calculated dynamically in the WorkflowEngine.
  IncidentStatus get status => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// IDs of other incidents related to this one.
  /// e.g. Car Accident -> Car Repair
  List<String> get linkedIncidentIds => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  DateTime get updated => throw _privateConstructorUsedError;

  /// The type of workflow this incident follows (e.g. "MedicalWorkflow", "InvoiceWorkflow").
  String get workflowType => throw _privateConstructorUsedError;

  /// Flexible metadata for type-specific fields.
  /// e.g. { "doctor_name": "Dr. Smith" }
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncidentCopyWith<Incident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentCopyWith<$Res> {
  factory $IncidentCopyWith(Incident value, $Res Function(Incident) then) =
      _$IncidentCopyWithImpl<$Res, Incident>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String ownerProfileId,
      IncidentType type,
      IncidentStatus status,
      List<String> tags,
      List<String> linkedIncidentIds,
      DateTime created,
      DateTime updated,
      String workflowType,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$IncidentCopyWithImpl<$Res, $Val extends Incident>
    implements $IncidentCopyWith<$Res> {
  _$IncidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? ownerProfileId = null,
    Object? type = null,
    Object? status = null,
    Object? tags = null,
    Object? linkedIncidentIds = null,
    Object? created = null,
    Object? updated = null,
    Object? workflowType = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerProfileId: null == ownerProfileId
          ? _value.ownerProfileId
          : ownerProfileId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IncidentType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IncidentStatus,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedIncidentIds: null == linkedIncidentIds
          ? _value.linkedIncidentIds
          : linkedIncidentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workflowType: null == workflowType
          ? _value.workflowType
          : workflowType // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentImplCopyWith<$Res>
    implements $IncidentCopyWith<$Res> {
  factory _$$IncidentImplCopyWith(
          _$IncidentImpl value, $Res Function(_$IncidentImpl) then) =
      __$$IncidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String ownerProfileId,
      IncidentType type,
      IncidentStatus status,
      List<String> tags,
      List<String> linkedIncidentIds,
      DateTime created,
      DateTime updated,
      String workflowType,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$IncidentImplCopyWithImpl<$Res>
    extends _$IncidentCopyWithImpl<$Res, _$IncidentImpl>
    implements _$$IncidentImplCopyWith<$Res> {
  __$$IncidentImplCopyWithImpl(
      _$IncidentImpl _value, $Res Function(_$IncidentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? ownerProfileId = null,
    Object? type = null,
    Object? status = null,
    Object? tags = null,
    Object? linkedIncidentIds = null,
    Object? created = null,
    Object? updated = null,
    Object? workflowType = null,
    Object? metadata = null,
  }) {
    return _then(_$IncidentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerProfileId: null == ownerProfileId
          ? _value.ownerProfileId
          : ownerProfileId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IncidentType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IncidentStatus,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      linkedIncidentIds: null == linkedIncidentIds
          ? _value._linkedIncidentIds
          : linkedIncidentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      workflowType: null == workflowType
          ? _value.workflowType
          : workflowType // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncidentImpl implements _Incident {
  const _$IncidentImpl(
      {required this.id,
      required this.title,
      this.description,
      required this.ownerProfileId,
      required this.type,
      required this.status,
      final List<String> tags = const [],
      final List<String> linkedIncidentIds = const [],
      required this.created,
      required this.updated,
      required this.workflowType,
      final Map<String, dynamic> metadata = const {}})
      : _tags = tags,
        _linkedIncidentIds = linkedIncidentIds,
        _metadata = metadata;

  factory _$IncidentImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String ownerProfileId;
  @override
  final IncidentType type;

  /// The current status of the incident.
  /// This might be calculated dynamically in the WorkflowEngine.
  @override
  final IncidentStatus status;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// IDs of other incidents related to this one.
  /// e.g. Car Accident -> Car Repair
  final List<String> _linkedIncidentIds;

  /// IDs of other incidents related to this one.
  /// e.g. Car Accident -> Car Repair
  @override
  @JsonKey()
  List<String> get linkedIncidentIds {
    if (_linkedIncidentIds is EqualUnmodifiableListView)
      return _linkedIncidentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linkedIncidentIds);
  }

  @override
  final DateTime created;
  @override
  final DateTime updated;

  /// The type of workflow this incident follows (e.g. "MedicalWorkflow", "InvoiceWorkflow").
  @override
  final String workflowType;

  /// Flexible metadata for type-specific fields.
  /// e.g. { "doctor_name": "Dr. Smith" }
  final Map<String, dynamic> _metadata;

  /// Flexible metadata for type-specific fields.
  /// e.g. { "doctor_name": "Dr. Smith" }
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Incident(id: $id, title: $title, description: $description, ownerProfileId: $ownerProfileId, type: $type, status: $status, tags: $tags, linkedIncidentIds: $linkedIncidentIds, created: $created, updated: $updated, workflowType: $workflowType, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerProfileId, ownerProfileId) ||
                other.ownerProfileId == ownerProfileId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._linkedIncidentIds, _linkedIncidentIds) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.workflowType, workflowType) ||
                other.workflowType == workflowType) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      ownerProfileId,
      type,
      status,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_linkedIncidentIds),
      created,
      updated,
      workflowType,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentImplCopyWith<_$IncidentImpl> get copyWith =>
      __$$IncidentImplCopyWithImpl<_$IncidentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentImplToJson(
      this,
    );
  }
}

abstract class _Incident implements Incident {
  const factory _Incident(
      {required final String id,
      required final String title,
      final String? description,
      required final String ownerProfileId,
      required final IncidentType type,
      required final IncidentStatus status,
      final List<String> tags,
      final List<String> linkedIncidentIds,
      required final DateTime created,
      required final DateTime updated,
      required final String workflowType,
      final Map<String, dynamic> metadata}) = _$IncidentImpl;

  factory _Incident.fromJson(Map<String, dynamic> json) =
      _$IncidentImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get ownerProfileId;
  @override
  IncidentType get type;
  @override

  /// The current status of the incident.
  /// This might be calculated dynamically in the WorkflowEngine.
  IncidentStatus get status;
  @override
  List<String> get tags;
  @override

  /// IDs of other incidents related to this one.
  /// e.g. Car Accident -> Car Repair
  List<String> get linkedIncidentIds;
  @override
  DateTime get created;
  @override
  DateTime get updated;
  @override

  /// The type of workflow this incident follows (e.g. "MedicalWorkflow", "InvoiceWorkflow").
  String get workflowType;
  @override

  /// Flexible metadata for type-specific fields.
  /// e.g. { "doctor_name": "Dr. Smith" }
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$IncidentImplCopyWith<_$IncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
