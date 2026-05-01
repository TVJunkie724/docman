// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {

 String get id; String get name; String? get avatarUrl;/// The ID of the PocketBase User linked to this profile (if any).
/// Children will have this as null.
 String? get linkedUserId;/// List of Profile IDs that have permission to manage this profile.
/// e.g. [MomID, DadID]
 List<String> get managers; String? get passportNumber; String? get socialSecurityNumber;/// Flexible metadata for other fields.
 Map<String, dynamic> get metadata;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.linkedUserId, linkedUserId) || other.linkedUserId == linkedUserId)&&const DeepCollectionEquality().equals(other.managers, managers)&&(identical(other.passportNumber, passportNumber) || other.passportNumber == passportNumber)&&(identical(other.socialSecurityNumber, socialSecurityNumber) || other.socialSecurityNumber == socialSecurityNumber)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,linkedUserId,const DeepCollectionEquality().hash(managers),passportNumber,socialSecurityNumber,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'Profile(id: $id, name: $name, avatarUrl: $avatarUrl, linkedUserId: $linkedUserId, managers: $managers, passportNumber: $passportNumber, socialSecurityNumber: $socialSecurityNumber, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatarUrl, String? linkedUserId, List<String> managers, String? passportNumber, String? socialSecurityNumber, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? linkedUserId = freezed,Object? managers = null,Object? passportNumber = freezed,Object? socialSecurityNumber = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,linkedUserId: freezed == linkedUserId ? _self.linkedUserId : linkedUserId // ignore: cast_nullable_to_non_nullable
as String?,managers: null == managers ? _self.managers : managers // ignore: cast_nullable_to_non_nullable
as List<String>,passportNumber: freezed == passportNumber ? _self.passportNumber : passportNumber // ignore: cast_nullable_to_non_nullable
as String?,socialSecurityNumber: freezed == socialSecurityNumber ? _self.socialSecurityNumber : socialSecurityNumber // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarUrl,  String? linkedUserId,  List<String> managers,  String? passportNumber,  String? socialSecurityNumber,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.linkedUserId,_that.managers,_that.passportNumber,_that.socialSecurityNumber,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarUrl,  String? linkedUserId,  List<String> managers,  String? passportNumber,  String? socialSecurityNumber,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.id,_that.name,_that.avatarUrl,_that.linkedUserId,_that.managers,_that.passportNumber,_that.socialSecurityNumber,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatarUrl,  String? linkedUserId,  List<String> managers,  String? passportNumber,  String? socialSecurityNumber,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.linkedUserId,_that.managers,_that.passportNumber,_that.socialSecurityNumber,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profile implements Profile {
  const _Profile({required this.id, required this.name, this.avatarUrl, this.linkedUserId, final  List<String> managers = const [], this.passportNumber, this.socialSecurityNumber, final  Map<String, dynamic> metadata = const {}}): _managers = managers,_metadata = metadata;
  factory _Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? avatarUrl;
/// The ID of the PocketBase User linked to this profile (if any).
/// Children will have this as null.
@override final  String? linkedUserId;
/// List of Profile IDs that have permission to manage this profile.
/// e.g. [MomID, DadID]
 final  List<String> _managers;
/// List of Profile IDs that have permission to manage this profile.
/// e.g. [MomID, DadID]
@override@JsonKey() List<String> get managers {
  if (_managers is EqualUnmodifiableListView) return _managers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_managers);
}

@override final  String? passportNumber;
@override final  String? socialSecurityNumber;
/// Flexible metadata for other fields.
 final  Map<String, dynamic> _metadata;
/// Flexible metadata for other fields.
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.linkedUserId, linkedUserId) || other.linkedUserId == linkedUserId)&&const DeepCollectionEquality().equals(other._managers, _managers)&&(identical(other.passportNumber, passportNumber) || other.passportNumber == passportNumber)&&(identical(other.socialSecurityNumber, socialSecurityNumber) || other.socialSecurityNumber == socialSecurityNumber)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,linkedUserId,const DeepCollectionEquality().hash(_managers),passportNumber,socialSecurityNumber,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'Profile(id: $id, name: $name, avatarUrl: $avatarUrl, linkedUserId: $linkedUserId, managers: $managers, passportNumber: $passportNumber, socialSecurityNumber: $socialSecurityNumber, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatarUrl, String? linkedUserId, List<String> managers, String? passportNumber, String? socialSecurityNumber, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = freezed,Object? linkedUserId = freezed,Object? managers = null,Object? passportNumber = freezed,Object? socialSecurityNumber = freezed,Object? metadata = null,}) {
  return _then(_Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,linkedUserId: freezed == linkedUserId ? _self.linkedUserId : linkedUserId // ignore: cast_nullable_to_non_nullable
as String?,managers: null == managers ? _self._managers : managers // ignore: cast_nullable_to_non_nullable
as List<String>,passportNumber: freezed == passportNumber ? _self.passportNumber : passportNumber // ignore: cast_nullable_to_non_nullable
as String?,socialSecurityNumber: freezed == socialSecurityNumber ? _self.socialSecurityNumber : socialSecurityNumber // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
