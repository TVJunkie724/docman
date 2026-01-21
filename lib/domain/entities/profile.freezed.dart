// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// The ID of the PocketBase User linked to this profile (if any).
  /// Children will have this as null.
  String? get linkedUserId => throw _privateConstructorUsedError;

  /// List of Profile IDs that have permission to manage this profile.
  /// e.g. [MomID, DadID]
  List<String> get managers => throw _privateConstructorUsedError;
  String? get passportNumber => throw _privateConstructorUsedError;
  String? get socialSecurityNumber => throw _privateConstructorUsedError;

  /// Flexible metadata for other fields.
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? avatarUrl,
      String? linkedUserId,
      List<String> managers,
      String? passportNumber,
      String? socialSecurityNumber,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? linkedUserId = freezed,
    Object? managers = null,
    Object? passportNumber = freezed,
    Object? socialSecurityNumber = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedUserId: freezed == linkedUserId
          ? _value.linkedUserId
          : linkedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      managers: null == managers
          ? _value.managers
          : managers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      socialSecurityNumber: freezed == socialSecurityNumber
          ? _value.socialSecurityNumber
          : socialSecurityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? avatarUrl,
      String? linkedUserId,
      List<String> managers,
      String? passportNumber,
      String? socialSecurityNumber,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? linkedUserId = freezed,
    Object? managers = null,
    Object? passportNumber = freezed,
    Object? socialSecurityNumber = freezed,
    Object? metadata = null,
  }) {
    return _then(_$ProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedUserId: freezed == linkedUserId
          ? _value.linkedUserId
          : linkedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      managers: null == managers
          ? _value._managers
          : managers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      socialSecurityNumber: freezed == socialSecurityNumber
          ? _value.socialSecurityNumber
          : socialSecurityNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {required this.id,
      required this.name,
      this.avatarUrl,
      this.linkedUserId,
      final List<String> managers = const [],
      this.passportNumber,
      this.socialSecurityNumber,
      final Map<String, dynamic> metadata = const {}})
      : _managers = managers,
        _metadata = metadata;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? avatarUrl;

  /// The ID of the PocketBase User linked to this profile (if any).
  /// Children will have this as null.
  @override
  final String? linkedUserId;

  /// List of Profile IDs that have permission to manage this profile.
  /// e.g. [MomID, DadID]
  final List<String> _managers;

  /// List of Profile IDs that have permission to manage this profile.
  /// e.g. [MomID, DadID]
  @override
  @JsonKey()
  List<String> get managers {
    if (_managers is EqualUnmodifiableListView) return _managers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_managers);
  }

  @override
  final String? passportNumber;
  @override
  final String? socialSecurityNumber;

  /// Flexible metadata for other fields.
  final Map<String, dynamic> _metadata;

  /// Flexible metadata for other fields.
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, avatarUrl: $avatarUrl, linkedUserId: $linkedUserId, managers: $managers, passportNumber: $passportNumber, socialSecurityNumber: $socialSecurityNumber, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.linkedUserId, linkedUserId) ||
                other.linkedUserId == linkedUserId) &&
            const DeepCollectionEquality().equals(other._managers, _managers) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber) &&
            (identical(other.socialSecurityNumber, socialSecurityNumber) ||
                other.socialSecurityNumber == socialSecurityNumber) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatarUrl,
      linkedUserId,
      const DeepCollectionEquality().hash(_managers),
      passportNumber,
      socialSecurityNumber,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final String id,
      required final String name,
      final String? avatarUrl,
      final String? linkedUserId,
      final List<String> managers,
      final String? passportNumber,
      final String? socialSecurityNumber,
      final Map<String, dynamic> metadata}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get avatarUrl;
  @override

  /// The ID of the PocketBase User linked to this profile (if any).
  /// Children will have this as null.
  String? get linkedUserId;
  @override

  /// List of Profile IDs that have permission to manage this profile.
  /// e.g. [MomID, DadID]
  List<String> get managers;
  @override
  String? get passportNumber;
  @override
  String? get socialSecurityNumber;
  @override

  /// Flexible metadata for other fields.
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
