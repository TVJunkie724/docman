// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncidentDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentDetailEvent()';
}


}

/// @nodoc
class $IncidentDetailEventCopyWith<$Res>  {
$IncidentDetailEventCopyWith(IncidentDetailEvent _, $Res Function(IncidentDetailEvent) __);
}


/// Adds pattern-matching-related methods to [IncidentDetailEvent].
extension IncidentDetailEventPatterns on IncidentDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadIncidentDetail value)?  load,TResult Function( DocumentsUpdated value)?  documentsUpdated,TResult Function( UpdateIncidentStatus value)?  updateStatus,TResult Function( UploadNewDocument value)?  uploadDocument,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadIncidentDetail() when load != null:
return load(_that);case DocumentsUpdated() when documentsUpdated != null:
return documentsUpdated(_that);case UpdateIncidentStatus() when updateStatus != null:
return updateStatus(_that);case UploadNewDocument() when uploadDocument != null:
return uploadDocument(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadIncidentDetail value)  load,required TResult Function( DocumentsUpdated value)  documentsUpdated,required TResult Function( UpdateIncidentStatus value)  updateStatus,required TResult Function( UploadNewDocument value)  uploadDocument,}){
final _that = this;
switch (_that) {
case LoadIncidentDetail():
return load(_that);case DocumentsUpdated():
return documentsUpdated(_that);case UpdateIncidentStatus():
return updateStatus(_that);case UploadNewDocument():
return uploadDocument(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadIncidentDetail value)?  load,TResult? Function( DocumentsUpdated value)?  documentsUpdated,TResult? Function( UpdateIncidentStatus value)?  updateStatus,TResult? Function( UploadNewDocument value)?  uploadDocument,}){
final _that = this;
switch (_that) {
case LoadIncidentDetail() when load != null:
return load(_that);case DocumentsUpdated() when documentsUpdated != null:
return documentsUpdated(_that);case UpdateIncidentStatus() when updateStatus != null:
return updateStatus(_that);case UploadNewDocument() when uploadDocument != null:
return uploadDocument(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String incidentId)?  load,TResult Function( List<Document> documents)?  documentsUpdated,TResult Function( IncidentStatus newStatus)?  updateStatus,TResult Function( File file,  Document metadata)?  uploadDocument,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadIncidentDetail() when load != null:
return load(_that.incidentId);case DocumentsUpdated() when documentsUpdated != null:
return documentsUpdated(_that.documents);case UpdateIncidentStatus() when updateStatus != null:
return updateStatus(_that.newStatus);case UploadNewDocument() when uploadDocument != null:
return uploadDocument(_that.file,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String incidentId)  load,required TResult Function( List<Document> documents)  documentsUpdated,required TResult Function( IncidentStatus newStatus)  updateStatus,required TResult Function( File file,  Document metadata)  uploadDocument,}) {final _that = this;
switch (_that) {
case LoadIncidentDetail():
return load(_that.incidentId);case DocumentsUpdated():
return documentsUpdated(_that.documents);case UpdateIncidentStatus():
return updateStatus(_that.newStatus);case UploadNewDocument():
return uploadDocument(_that.file,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String incidentId)?  load,TResult? Function( List<Document> documents)?  documentsUpdated,TResult? Function( IncidentStatus newStatus)?  updateStatus,TResult? Function( File file,  Document metadata)?  uploadDocument,}) {final _that = this;
switch (_that) {
case LoadIncidentDetail() when load != null:
return load(_that.incidentId);case DocumentsUpdated() when documentsUpdated != null:
return documentsUpdated(_that.documents);case UpdateIncidentStatus() when updateStatus != null:
return updateStatus(_that.newStatus);case UploadNewDocument() when uploadDocument != null:
return uploadDocument(_that.file,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class LoadIncidentDetail implements IncidentDetailEvent {
  const LoadIncidentDetail(this.incidentId);
  

 final  String incidentId;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadIncidentDetailCopyWith<LoadIncidentDetail> get copyWith => _$LoadIncidentDetailCopyWithImpl<LoadIncidentDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadIncidentDetail&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId));
}


@override
int get hashCode => Object.hash(runtimeType,incidentId);

@override
String toString() {
  return 'IncidentDetailEvent.load(incidentId: $incidentId)';
}


}

/// @nodoc
abstract mixin class $LoadIncidentDetailCopyWith<$Res> implements $IncidentDetailEventCopyWith<$Res> {
  factory $LoadIncidentDetailCopyWith(LoadIncidentDetail value, $Res Function(LoadIncidentDetail) _then) = _$LoadIncidentDetailCopyWithImpl;
@useResult
$Res call({
 String incidentId
});




}
/// @nodoc
class _$LoadIncidentDetailCopyWithImpl<$Res>
    implements $LoadIncidentDetailCopyWith<$Res> {
  _$LoadIncidentDetailCopyWithImpl(this._self, this._then);

  final LoadIncidentDetail _self;
  final $Res Function(LoadIncidentDetail) _then;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? incidentId = null,}) {
  return _then(LoadIncidentDetail(
null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DocumentsUpdated implements IncidentDetailEvent {
  const DocumentsUpdated(final  List<Document> documents): _documents = documents;
  

 final  List<Document> _documents;
 List<Document> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}


/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentsUpdatedCopyWith<DocumentsUpdated> get copyWith => _$DocumentsUpdatedCopyWithImpl<DocumentsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentsUpdated&&const DeepCollectionEquality().equals(other._documents, _documents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'IncidentDetailEvent.documentsUpdated(documents: $documents)';
}


}

/// @nodoc
abstract mixin class $DocumentsUpdatedCopyWith<$Res> implements $IncidentDetailEventCopyWith<$Res> {
  factory $DocumentsUpdatedCopyWith(DocumentsUpdated value, $Res Function(DocumentsUpdated) _then) = _$DocumentsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Document> documents
});




}
/// @nodoc
class _$DocumentsUpdatedCopyWithImpl<$Res>
    implements $DocumentsUpdatedCopyWith<$Res> {
  _$DocumentsUpdatedCopyWithImpl(this._self, this._then);

  final DocumentsUpdated _self;
  final $Res Function(DocumentsUpdated) _then;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? documents = null,}) {
  return _then(DocumentsUpdated(
null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<Document>,
  ));
}


}

/// @nodoc


class UpdateIncidentStatus implements IncidentDetailEvent {
  const UpdateIncidentStatus(this.newStatus);
  

 final  IncidentStatus newStatus;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateIncidentStatusCopyWith<UpdateIncidentStatus> get copyWith => _$UpdateIncidentStatusCopyWithImpl<UpdateIncidentStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateIncidentStatus&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus));
}


@override
int get hashCode => Object.hash(runtimeType,newStatus);

@override
String toString() {
  return 'IncidentDetailEvent.updateStatus(newStatus: $newStatus)';
}


}

/// @nodoc
abstract mixin class $UpdateIncidentStatusCopyWith<$Res> implements $IncidentDetailEventCopyWith<$Res> {
  factory $UpdateIncidentStatusCopyWith(UpdateIncidentStatus value, $Res Function(UpdateIncidentStatus) _then) = _$UpdateIncidentStatusCopyWithImpl;
@useResult
$Res call({
 IncidentStatus newStatus
});




}
/// @nodoc
class _$UpdateIncidentStatusCopyWithImpl<$Res>
    implements $UpdateIncidentStatusCopyWith<$Res> {
  _$UpdateIncidentStatusCopyWithImpl(this._self, this._then);

  final UpdateIncidentStatus _self;
  final $Res Function(UpdateIncidentStatus) _then;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newStatus = null,}) {
  return _then(UpdateIncidentStatus(
null == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as IncidentStatus,
  ));
}


}

/// @nodoc


class UploadNewDocument implements IncidentDetailEvent {
  const UploadNewDocument(this.file, this.metadata);
  

 final  File file;
 final  Document metadata;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadNewDocumentCopyWith<UploadNewDocument> get copyWith => _$UploadNewDocumentCopyWithImpl<UploadNewDocument>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadNewDocument&&(identical(other.file, file) || other.file == file)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}


@override
int get hashCode => Object.hash(runtimeType,file,metadata);

@override
String toString() {
  return 'IncidentDetailEvent.uploadDocument(file: $file, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $UploadNewDocumentCopyWith<$Res> implements $IncidentDetailEventCopyWith<$Res> {
  factory $UploadNewDocumentCopyWith(UploadNewDocument value, $Res Function(UploadNewDocument) _then) = _$UploadNewDocumentCopyWithImpl;
@useResult
$Res call({
 File file, Document metadata
});


$DocumentCopyWith<$Res> get metadata;

}
/// @nodoc
class _$UploadNewDocumentCopyWithImpl<$Res>
    implements $UploadNewDocumentCopyWith<$Res> {
  _$UploadNewDocumentCopyWithImpl(this._self, this._then);

  final UploadNewDocument _self;
  final $Res Function(UploadNewDocument) _then;

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,Object? metadata = null,}) {
  return _then(UploadNewDocument(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Document,
  ));
}

/// Create a copy of IncidentDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentCopyWith<$Res> get metadata {
  
  return $DocumentCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

/// @nodoc
mixin _$IncidentDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentDetailState()';
}


}

/// @nodoc
class $IncidentDetailStateCopyWith<$Res>  {
$IncidentDetailStateCopyWith(IncidentDetailState _, $Res Function(IncidentDetailState) __);
}


/// Adds pattern-matching-related methods to [IncidentDetailState].
extension IncidentDetailStatePatterns on IncidentDetailState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Incident incident,  List<Document> documents,  List<IncidentStatus> availableActions)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.incident,_that.documents,_that.availableActions);case _Failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Incident incident,  List<Document> documents,  List<IncidentStatus> availableActions)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.incident,_that.documents,_that.availableActions);case _Failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Incident incident,  List<Document> documents,  List<IncidentStatus> availableActions)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.incident,_that.documents,_that.availableActions);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements IncidentDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentDetailState.initial()';
}


}




/// @nodoc


class _Loading implements IncidentDetailState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IncidentDetailState.loading()';
}


}




/// @nodoc


class _Loaded implements IncidentDetailState {
  const _Loaded({required this.incident, required final  List<Document> documents, required final  List<IncidentStatus> availableActions}): _documents = documents,_availableActions = availableActions;
  

 final  Incident incident;
 final  List<Document> _documents;
 List<Document> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

 final  List<IncidentStatus> _availableActions;
 List<IncidentStatus> get availableActions {
  if (_availableActions is EqualUnmodifiableListView) return _availableActions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableActions);
}


/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.incident, incident) || other.incident == incident)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._availableActions, _availableActions));
}


@override
int get hashCode => Object.hash(runtimeType,incident,const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_availableActions));

@override
String toString() {
  return 'IncidentDetailState.loaded(incident: $incident, documents: $documents, availableActions: $availableActions)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $IncidentDetailStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Incident incident, List<Document> documents, List<IncidentStatus> availableActions
});


$IncidentCopyWith<$Res> get incident;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? incident = null,Object? documents = null,Object? availableActions = null,}) {
  return _then(_Loaded(
incident: null == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as Incident,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<Document>,availableActions: null == availableActions ? _self._availableActions : availableActions // ignore: cast_nullable_to_non_nullable
as List<IncidentStatus>,
  ));
}

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncidentCopyWith<$Res> get incident {
  
  return $IncidentCopyWith<$Res>(_self.incident, (value) {
    return _then(_self.copyWith(incident: value));
  });
}
}

/// @nodoc


class _Failure implements IncidentDetailState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of IncidentDetailState
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
  return 'IncidentDetailState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $IncidentDetailStateCopyWith<$Res> {
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

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
