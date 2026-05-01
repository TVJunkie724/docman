// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncidentListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentListEvent()';
}


}

/// @nodoc
class $IncidentListEventCopyWith<$Res>  {
$IncidentListEventCopyWith(IncidentListEvent _, $Res Function(IncidentListEvent) __);
}


/// Adds pattern-matching-related methods to [IncidentListEvent].
extension IncidentListEventPatterns on IncidentListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadIncidents value)?  load,TResult Function( IncidentsUpdated value)?  updated,TResult Function( IncidentsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadIncidents() when load != null:
return load(_that);case IncidentsUpdated() when updated != null:
return updated(_that);case IncidentsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadIncidents value)  load,required TResult Function( IncidentsUpdated value)  updated,required TResult Function( IncidentsError value)  error,}){
final _that = this;
switch (_that) {
case LoadIncidents():
return load(_that);case IncidentsUpdated():
return updated(_that);case IncidentsError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadIncidents value)?  load,TResult? Function( IncidentsUpdated value)?  updated,TResult? Function( IncidentsError value)?  error,}){
final _that = this;
switch (_that) {
case LoadIncidents() when load != null:
return load(_that);case IncidentsUpdated() when updated != null:
return updated(_that);case IncidentsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String profileId,  String? tag)?  load,TResult Function( List<Incident> incidents)?  updated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadIncidents() when load != null:
return load(_that.profileId,_that.tag);case IncidentsUpdated() when updated != null:
return updated(_that.incidents);case IncidentsError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String profileId,  String? tag)  load,required TResult Function( List<Incident> incidents)  updated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LoadIncidents():
return load(_that.profileId,_that.tag);case IncidentsUpdated():
return updated(_that.incidents);case IncidentsError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String profileId,  String? tag)?  load,TResult? Function( List<Incident> incidents)?  updated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LoadIncidents() when load != null:
return load(_that.profileId,_that.tag);case IncidentsUpdated() when updated != null:
return updated(_that.incidents);case IncidentsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoadIncidents implements IncidentListEvent {
  const LoadIncidents(this.profileId, {this.tag});
  

 final  String profileId;
 final  String? tag;

/// Create a copy of IncidentListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadIncidentsCopyWith<LoadIncidents> get copyWith => _$LoadIncidentsCopyWithImpl<LoadIncidents>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadIncidents&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,profileId,tag);

@override
String toString() {
  return 'IncidentListEvent.load(profileId: $profileId, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $LoadIncidentsCopyWith<$Res> implements $IncidentListEventCopyWith<$Res> {
  factory $LoadIncidentsCopyWith(LoadIncidents value, $Res Function(LoadIncidents) _then) = _$LoadIncidentsCopyWithImpl;
@useResult
$Res call({
 String profileId, String? tag
});




}
/// @nodoc
class _$LoadIncidentsCopyWithImpl<$Res>
    implements $LoadIncidentsCopyWith<$Res> {
  _$LoadIncidentsCopyWithImpl(this._self, this._then);

  final LoadIncidents _self;
  final $Res Function(LoadIncidents) _then;

/// Create a copy of IncidentListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? tag = freezed,}) {
  return _then(LoadIncidents(
null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class IncidentsUpdated implements IncidentListEvent {
  const IncidentsUpdated(final  List<Incident> incidents): _incidents = incidents;
  

 final  List<Incident> _incidents;
 List<Incident> get incidents {
  if (_incidents is EqualUnmodifiableListView) return _incidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incidents);
}


/// Create a copy of IncidentListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentsUpdatedCopyWith<IncidentsUpdated> get copyWith => _$IncidentsUpdatedCopyWithImpl<IncidentsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentsUpdated&&const DeepCollectionEquality().equals(other._incidents, _incidents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_incidents));

@override
String toString() {
  return 'IncidentListEvent.updated(incidents: $incidents)';
}


}

/// @nodoc
abstract mixin class $IncidentsUpdatedCopyWith<$Res> implements $IncidentListEventCopyWith<$Res> {
  factory $IncidentsUpdatedCopyWith(IncidentsUpdated value, $Res Function(IncidentsUpdated) _then) = _$IncidentsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Incident> incidents
});




}
/// @nodoc
class _$IncidentsUpdatedCopyWithImpl<$Res>
    implements $IncidentsUpdatedCopyWith<$Res> {
  _$IncidentsUpdatedCopyWithImpl(this._self, this._then);

  final IncidentsUpdated _self;
  final $Res Function(IncidentsUpdated) _then;

/// Create a copy of IncidentListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? incidents = null,}) {
  return _then(IncidentsUpdated(
null == incidents ? _self._incidents : incidents // ignore: cast_nullable_to_non_nullable
as List<Incident>,
  ));
}


}

/// @nodoc


class IncidentsError implements IncidentListEvent {
  const IncidentsError(this.message);
  

 final  String message;

/// Create a copy of IncidentListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentsErrorCopyWith<IncidentsError> get copyWith => _$IncidentsErrorCopyWithImpl<IncidentsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'IncidentListEvent.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $IncidentsErrorCopyWith<$Res> implements $IncidentListEventCopyWith<$Res> {
  factory $IncidentsErrorCopyWith(IncidentsError value, $Res Function(IncidentsError) _then) = _$IncidentsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$IncidentsErrorCopyWithImpl<$Res>
    implements $IncidentsErrorCopyWith<$Res> {
  _$IncidentsErrorCopyWithImpl(this._self, this._then);

  final IncidentsError _self;
  final $Res Function(IncidentsError) _then;

/// Create a copy of IncidentListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(IncidentsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$IncidentListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentListState()';
}


}

/// @nodoc
class $IncidentListStateCopyWith<$Res>  {
$IncidentListStateCopyWith(IncidentListState _, $Res Function(IncidentListState) __);
}


/// Adds pattern-matching-related methods to [IncidentListState].
extension IncidentListStatePatterns on IncidentListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Failure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Incident> incidents)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.incidents);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Incident> incidents)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.incidents);case _Failure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Incident> incidents)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.incidents);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements IncidentListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentListState.initial()';
}


}




/// @nodoc


class _Loading implements IncidentListState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentListState.loading()';
}


}




/// @nodoc


class _Loaded implements IncidentListState {
  const _Loaded(final  List<Incident> incidents): _incidents = incidents;
  

 final  List<Incident> _incidents;
 List<Incident> get incidents {
  if (_incidents is EqualUnmodifiableListView) return _incidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incidents);
}


/// Create a copy of IncidentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._incidents, _incidents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_incidents));

@override
String toString() {
  return 'IncidentListState.loaded(incidents: $incidents)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $IncidentListStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Incident> incidents
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of IncidentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? incidents = null,}) {
  return _then(_Loaded(
null == incidents ? _self._incidents : incidents // ignore: cast_nullable_to_non_nullable
as List<Incident>,
  ));
}


}

/// @nodoc


class _Failure implements IncidentListState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of IncidentListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'IncidentListState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $IncidentListStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of IncidentListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
