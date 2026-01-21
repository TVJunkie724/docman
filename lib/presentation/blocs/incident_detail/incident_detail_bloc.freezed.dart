// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IncidentDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String incidentId) load,
    required TResult Function(List<Document> documents) documentsUpdated,
    required TResult Function(IncidentStatus newStatus) updateStatus,
    required TResult Function(File file, Document metadata) uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String incidentId)? load,
    TResult? Function(List<Document> documents)? documentsUpdated,
    TResult? Function(IncidentStatus newStatus)? updateStatus,
    TResult? Function(File file, Document metadata)? uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String incidentId)? load,
    TResult Function(List<Document> documents)? documentsUpdated,
    TResult Function(IncidentStatus newStatus)? updateStatus,
    TResult Function(File file, Document metadata)? uploadDocument,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncidentDetail value) load,
    required TResult Function(DocumentsUpdated value) documentsUpdated,
    required TResult Function(UpdateIncidentStatus value) updateStatus,
    required TResult Function(UploadNewDocument value) uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncidentDetail value)? load,
    TResult? Function(DocumentsUpdated value)? documentsUpdated,
    TResult? Function(UpdateIncidentStatus value)? updateStatus,
    TResult? Function(UploadNewDocument value)? uploadDocument,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncidentDetail value)? load,
    TResult Function(DocumentsUpdated value)? documentsUpdated,
    TResult Function(UpdateIncidentStatus value)? updateStatus,
    TResult Function(UploadNewDocument value)? uploadDocument,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentDetailEventCopyWith<$Res> {
  factory $IncidentDetailEventCopyWith(
          IncidentDetailEvent value, $Res Function(IncidentDetailEvent) then) =
      _$IncidentDetailEventCopyWithImpl<$Res, IncidentDetailEvent>;
}

/// @nodoc
class _$IncidentDetailEventCopyWithImpl<$Res, $Val extends IncidentDetailEvent>
    implements $IncidentDetailEventCopyWith<$Res> {
  _$IncidentDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadIncidentDetailImplCopyWith<$Res> {
  factory _$$LoadIncidentDetailImplCopyWith(_$LoadIncidentDetailImpl value,
          $Res Function(_$LoadIncidentDetailImpl) then) =
      __$$LoadIncidentDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String incidentId});
}

/// @nodoc
class __$$LoadIncidentDetailImplCopyWithImpl<$Res>
    extends _$IncidentDetailEventCopyWithImpl<$Res, _$LoadIncidentDetailImpl>
    implements _$$LoadIncidentDetailImplCopyWith<$Res> {
  __$$LoadIncidentDetailImplCopyWithImpl(_$LoadIncidentDetailImpl _value,
      $Res Function(_$LoadIncidentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
  }) {
    return _then(_$LoadIncidentDetailImpl(
      null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadIncidentDetailImpl implements LoadIncidentDetail {
  const _$LoadIncidentDetailImpl(this.incidentId);

  @override
  final String incidentId;

  @override
  String toString() {
    return 'IncidentDetailEvent.load(incidentId: $incidentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadIncidentDetailImpl &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incidentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadIncidentDetailImplCopyWith<_$LoadIncidentDetailImpl> get copyWith =>
      __$$LoadIncidentDetailImplCopyWithImpl<_$LoadIncidentDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String incidentId) load,
    required TResult Function(List<Document> documents) documentsUpdated,
    required TResult Function(IncidentStatus newStatus) updateStatus,
    required TResult Function(File file, Document metadata) uploadDocument,
  }) {
    return load(incidentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String incidentId)? load,
    TResult? Function(List<Document> documents)? documentsUpdated,
    TResult? Function(IncidentStatus newStatus)? updateStatus,
    TResult? Function(File file, Document metadata)? uploadDocument,
  }) {
    return load?.call(incidentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String incidentId)? load,
    TResult Function(List<Document> documents)? documentsUpdated,
    TResult Function(IncidentStatus newStatus)? updateStatus,
    TResult Function(File file, Document metadata)? uploadDocument,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(incidentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncidentDetail value) load,
    required TResult Function(DocumentsUpdated value) documentsUpdated,
    required TResult Function(UpdateIncidentStatus value) updateStatus,
    required TResult Function(UploadNewDocument value) uploadDocument,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncidentDetail value)? load,
    TResult? Function(DocumentsUpdated value)? documentsUpdated,
    TResult? Function(UpdateIncidentStatus value)? updateStatus,
    TResult? Function(UploadNewDocument value)? uploadDocument,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncidentDetail value)? load,
    TResult Function(DocumentsUpdated value)? documentsUpdated,
    TResult Function(UpdateIncidentStatus value)? updateStatus,
    TResult Function(UploadNewDocument value)? uploadDocument,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadIncidentDetail implements IncidentDetailEvent {
  const factory LoadIncidentDetail(final String incidentId) =
      _$LoadIncidentDetailImpl;

  String get incidentId;
  @JsonKey(ignore: true)
  _$$LoadIncidentDetailImplCopyWith<_$LoadIncidentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentsUpdatedImplCopyWith<$Res> {
  factory _$$DocumentsUpdatedImplCopyWith(_$DocumentsUpdatedImpl value,
          $Res Function(_$DocumentsUpdatedImpl) then) =
      __$$DocumentsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Document> documents});
}

/// @nodoc
class __$$DocumentsUpdatedImplCopyWithImpl<$Res>
    extends _$IncidentDetailEventCopyWithImpl<$Res, _$DocumentsUpdatedImpl>
    implements _$$DocumentsUpdatedImplCopyWith<$Res> {
  __$$DocumentsUpdatedImplCopyWithImpl(_$DocumentsUpdatedImpl _value,
      $Res Function(_$DocumentsUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = null,
  }) {
    return _then(_$DocumentsUpdatedImpl(
      null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
    ));
  }
}

/// @nodoc

class _$DocumentsUpdatedImpl implements DocumentsUpdated {
  const _$DocumentsUpdatedImpl(final List<Document> documents)
      : _documents = documents;

  final List<Document> _documents;
  @override
  List<Document> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'IncidentDetailEvent.documentsUpdated(documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentsUpdatedImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_documents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentsUpdatedImplCopyWith<_$DocumentsUpdatedImpl> get copyWith =>
      __$$DocumentsUpdatedImplCopyWithImpl<_$DocumentsUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String incidentId) load,
    required TResult Function(List<Document> documents) documentsUpdated,
    required TResult Function(IncidentStatus newStatus) updateStatus,
    required TResult Function(File file, Document metadata) uploadDocument,
  }) {
    return documentsUpdated(documents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String incidentId)? load,
    TResult? Function(List<Document> documents)? documentsUpdated,
    TResult? Function(IncidentStatus newStatus)? updateStatus,
    TResult? Function(File file, Document metadata)? uploadDocument,
  }) {
    return documentsUpdated?.call(documents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String incidentId)? load,
    TResult Function(List<Document> documents)? documentsUpdated,
    TResult Function(IncidentStatus newStatus)? updateStatus,
    TResult Function(File file, Document metadata)? uploadDocument,
    required TResult orElse(),
  }) {
    if (documentsUpdated != null) {
      return documentsUpdated(documents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncidentDetail value) load,
    required TResult Function(DocumentsUpdated value) documentsUpdated,
    required TResult Function(UpdateIncidentStatus value) updateStatus,
    required TResult Function(UploadNewDocument value) uploadDocument,
  }) {
    return documentsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncidentDetail value)? load,
    TResult? Function(DocumentsUpdated value)? documentsUpdated,
    TResult? Function(UpdateIncidentStatus value)? updateStatus,
    TResult? Function(UploadNewDocument value)? uploadDocument,
  }) {
    return documentsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncidentDetail value)? load,
    TResult Function(DocumentsUpdated value)? documentsUpdated,
    TResult Function(UpdateIncidentStatus value)? updateStatus,
    TResult Function(UploadNewDocument value)? uploadDocument,
    required TResult orElse(),
  }) {
    if (documentsUpdated != null) {
      return documentsUpdated(this);
    }
    return orElse();
  }
}

abstract class DocumentsUpdated implements IncidentDetailEvent {
  const factory DocumentsUpdated(final List<Document> documents) =
      _$DocumentsUpdatedImpl;

  List<Document> get documents;
  @JsonKey(ignore: true)
  _$$DocumentsUpdatedImplCopyWith<_$DocumentsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateIncidentStatusImplCopyWith<$Res> {
  factory _$$UpdateIncidentStatusImplCopyWith(_$UpdateIncidentStatusImpl value,
          $Res Function(_$UpdateIncidentStatusImpl) then) =
      __$$UpdateIncidentStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IncidentStatus newStatus});
}

/// @nodoc
class __$$UpdateIncidentStatusImplCopyWithImpl<$Res>
    extends _$IncidentDetailEventCopyWithImpl<$Res, _$UpdateIncidentStatusImpl>
    implements _$$UpdateIncidentStatusImplCopyWith<$Res> {
  __$$UpdateIncidentStatusImplCopyWithImpl(_$UpdateIncidentStatusImpl _value,
      $Res Function(_$UpdateIncidentStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newStatus = null,
  }) {
    return _then(_$UpdateIncidentStatusImpl(
      null == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as IncidentStatus,
    ));
  }
}

/// @nodoc

class _$UpdateIncidentStatusImpl implements UpdateIncidentStatus {
  const _$UpdateIncidentStatusImpl(this.newStatus);

  @override
  final IncidentStatus newStatus;

  @override
  String toString() {
    return 'IncidentDetailEvent.updateStatus(newStatus: $newStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateIncidentStatusImpl &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateIncidentStatusImplCopyWith<_$UpdateIncidentStatusImpl>
      get copyWith =>
          __$$UpdateIncidentStatusImplCopyWithImpl<_$UpdateIncidentStatusImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String incidentId) load,
    required TResult Function(List<Document> documents) documentsUpdated,
    required TResult Function(IncidentStatus newStatus) updateStatus,
    required TResult Function(File file, Document metadata) uploadDocument,
  }) {
    return updateStatus(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String incidentId)? load,
    TResult? Function(List<Document> documents)? documentsUpdated,
    TResult? Function(IncidentStatus newStatus)? updateStatus,
    TResult? Function(File file, Document metadata)? uploadDocument,
  }) {
    return updateStatus?.call(newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String incidentId)? load,
    TResult Function(List<Document> documents)? documentsUpdated,
    TResult Function(IncidentStatus newStatus)? updateStatus,
    TResult Function(File file, Document metadata)? uploadDocument,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncidentDetail value) load,
    required TResult Function(DocumentsUpdated value) documentsUpdated,
    required TResult Function(UpdateIncidentStatus value) updateStatus,
    required TResult Function(UploadNewDocument value) uploadDocument,
  }) {
    return updateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncidentDetail value)? load,
    TResult? Function(DocumentsUpdated value)? documentsUpdated,
    TResult? Function(UpdateIncidentStatus value)? updateStatus,
    TResult? Function(UploadNewDocument value)? uploadDocument,
  }) {
    return updateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncidentDetail value)? load,
    TResult Function(DocumentsUpdated value)? documentsUpdated,
    TResult Function(UpdateIncidentStatus value)? updateStatus,
    TResult Function(UploadNewDocument value)? uploadDocument,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(this);
    }
    return orElse();
  }
}

abstract class UpdateIncidentStatus implements IncidentDetailEvent {
  const factory UpdateIncidentStatus(final IncidentStatus newStatus) =
      _$UpdateIncidentStatusImpl;

  IncidentStatus get newStatus;
  @JsonKey(ignore: true)
  _$$UpdateIncidentStatusImplCopyWith<_$UpdateIncidentStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadNewDocumentImplCopyWith<$Res> {
  factory _$$UploadNewDocumentImplCopyWith(_$UploadNewDocumentImpl value,
          $Res Function(_$UploadNewDocumentImpl) then) =
      __$$UploadNewDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file, Document metadata});

  $DocumentCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$UploadNewDocumentImplCopyWithImpl<$Res>
    extends _$IncidentDetailEventCopyWithImpl<$Res, _$UploadNewDocumentImpl>
    implements _$$UploadNewDocumentImplCopyWith<$Res> {
  __$$UploadNewDocumentImplCopyWithImpl(_$UploadNewDocumentImpl _value,
      $Res Function(_$UploadNewDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? metadata = null,
  }) {
    return _then(_$UploadNewDocumentImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Document,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentCopyWith<$Res> get metadata {
    return $DocumentCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value));
    });
  }
}

/// @nodoc

class _$UploadNewDocumentImpl implements UploadNewDocument {
  const _$UploadNewDocumentImpl(this.file, this.metadata);

  @override
  final File file;
  @override
  final Document metadata;

  @override
  String toString() {
    return 'IncidentDetailEvent.uploadDocument(file: $file, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadNewDocumentImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, metadata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadNewDocumentImplCopyWith<_$UploadNewDocumentImpl> get copyWith =>
      __$$UploadNewDocumentImplCopyWithImpl<_$UploadNewDocumentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String incidentId) load,
    required TResult Function(List<Document> documents) documentsUpdated,
    required TResult Function(IncidentStatus newStatus) updateStatus,
    required TResult Function(File file, Document metadata) uploadDocument,
  }) {
    return uploadDocument(file, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String incidentId)? load,
    TResult? Function(List<Document> documents)? documentsUpdated,
    TResult? Function(IncidentStatus newStatus)? updateStatus,
    TResult? Function(File file, Document metadata)? uploadDocument,
  }) {
    return uploadDocument?.call(file, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String incidentId)? load,
    TResult Function(List<Document> documents)? documentsUpdated,
    TResult Function(IncidentStatus newStatus)? updateStatus,
    TResult Function(File file, Document metadata)? uploadDocument,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(file, metadata);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadIncidentDetail value) load,
    required TResult Function(DocumentsUpdated value) documentsUpdated,
    required TResult Function(UpdateIncidentStatus value) updateStatus,
    required TResult Function(UploadNewDocument value) uploadDocument,
  }) {
    return uploadDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadIncidentDetail value)? load,
    TResult? Function(DocumentsUpdated value)? documentsUpdated,
    TResult? Function(UpdateIncidentStatus value)? updateStatus,
    TResult? Function(UploadNewDocument value)? uploadDocument,
  }) {
    return uploadDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadIncidentDetail value)? load,
    TResult Function(DocumentsUpdated value)? documentsUpdated,
    TResult Function(UpdateIncidentStatus value)? updateStatus,
    TResult Function(UploadNewDocument value)? uploadDocument,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(this);
    }
    return orElse();
  }
}

abstract class UploadNewDocument implements IncidentDetailEvent {
  const factory UploadNewDocument(final File file, final Document metadata) =
      _$UploadNewDocumentImpl;

  File get file;
  Document get metadata;
  @JsonKey(ignore: true)
  _$$UploadNewDocumentImplCopyWith<_$UploadNewDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IncidentDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)
        loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentDetailStateCopyWith<$Res> {
  factory $IncidentDetailStateCopyWith(
          IncidentDetailState value, $Res Function(IncidentDetailState) then) =
      _$IncidentDetailStateCopyWithImpl<$Res, IncidentDetailState>;
}

/// @nodoc
class _$IncidentDetailStateCopyWithImpl<$Res, $Val extends IncidentDetailState>
    implements $IncidentDetailStateCopyWith<$Res> {
  _$IncidentDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$IncidentDetailStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'IncidentDetailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements IncidentDetailState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$IncidentDetailStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'IncidentDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements IncidentDetailState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Incident incident,
      List<Document> documents,
      List<IncidentStatus> availableActions});

  $IncidentCopyWith<$Res> get incident;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$IncidentDetailStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incident = null,
    Object? documents = null,
    Object? availableActions = null,
  }) {
    return _then(_$LoadedImpl(
      incident: null == incident
          ? _value.incident
          : incident // ignore: cast_nullable_to_non_nullable
              as Incident,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<Document>,
      availableActions: null == availableActions
          ? _value._availableActions
          : availableActions // ignore: cast_nullable_to_non_nullable
              as List<IncidentStatus>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $IncidentCopyWith<$Res> get incident {
    return $IncidentCopyWith<$Res>(_value.incident, (value) {
      return _then(_value.copyWith(incident: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required this.incident,
      required final List<Document> documents,
      required final List<IncidentStatus> availableActions})
      : _documents = documents,
        _availableActions = availableActions;

  @override
  final Incident incident;
  final List<Document> _documents;
  @override
  List<Document> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<IncidentStatus> _availableActions;
  @override
  List<IncidentStatus> get availableActions {
    if (_availableActions is EqualUnmodifiableListView)
      return _availableActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableActions);
  }

  @override
  String toString() {
    return 'IncidentDetailState.loaded(incident: $incident, documents: $documents, availableActions: $availableActions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.incident, incident) ||
                other.incident == incident) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality()
                .equals(other._availableActions, _availableActions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      incident,
      const DeepCollectionEquality().hash(_documents),
      const DeepCollectionEquality().hash(_availableActions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(incident, documents, availableActions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(incident, documents, availableActions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(incident, documents, availableActions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements IncidentDetailState {
  const factory _Loaded(
      {required final Incident incident,
      required final List<Document> documents,
      required final List<IncidentStatus> availableActions}) = _$LoadedImpl;

  Incident get incident;
  List<Document> get documents;
  List<IncidentStatus> get availableActions;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$IncidentDetailStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'IncidentDetailState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)
        loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Incident incident, List<Document> documents,
            List<IncidentStatus> availableActions)?
        loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements IncidentDetailState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
