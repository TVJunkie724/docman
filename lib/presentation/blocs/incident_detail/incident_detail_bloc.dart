import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/incident.dart';
import '../../../domain/entities/document.dart';
import '../../../domain/entities/enums.dart';
import '../../../domain/repositories/i_incident_repository.dart';
import '../../../domain/repositories/i_document_repository.dart';
import '../../../domain/workflows/workflow_engine.dart';

part 'incident_detail_event.dart';
part 'incident_detail_state.dart';
part 'incident_detail_bloc.freezed.dart';

class IncidentDetailBloc extends Bloc<IncidentDetailEvent, IncidentDetailState> {
  final IIncidentRepository _incidentRepo;
  final IDocumentRepository _documentRepo;
  final WorkflowEngine _workflowEngine;
  
  StreamSubscription<List<Document>>? _docSubscription;

  IncidentDetailBloc(
    this._incidentRepo,
    this._documentRepo,
    this._workflowEngine,
  ) : super(const IncidentDetailState.initial()) {
    on<LoadIncidentDetail>(_onLoad);
    on<DocumentsUpdated>(_onDocsUpdated);
    on<UpdateIncidentStatus>(_onUpdateStatus);
    on<UploadNewDocument>(_onUploadDocument);
  }

  Future<void> _onLoad(LoadIncidentDetail event, Emitter<IncidentDetailState> emit) async {
    emit(const IncidentDetailState.loading());
    try {
      final incident = await _incidentRepo.getIncident(event.incidentId);
      if (incident == null) {
        emit(const IncidentDetailState.failure("Incident not found"));
        return;
      }

      // Start watching documents
      await _docSubscription?.cancel();
      _docSubscription = _documentRepo.watchDocuments(event.incidentId).listen(
        (docs) => add(IncidentDetailEvent.documentsUpdated(docs)),
      );

      // Emit initial loaded state (with empty docs until stream fires)
      emit(IncidentDetailState.loaded(
        incident: incident,
        documents: [],
        availableActions: _workflowEngine.getAvailableNextStatuses(incident),
      ));
    } catch (e) {
      emit(IncidentDetailState.failure(e.toString()));
    }
  }

  void _onDocsUpdated(DocumentsUpdated event, Emitter<IncidentDetailState> emit) {
    state.mapOrNull(loaded: (currentState) {
      emit(currentState.copyWith(documents: event.documents));
    });
  }

  Future<void> _onUpdateStatus(UpdateIncidentStatus event, Emitter<IncidentDetailState> emit) async {
    // Optimistic update? Or wait for server?
    // Let's wait for server to be safe, but show loading.
    // Actually, we can just update the repo and let the stream (if we watched incident) update us.
    // But here we fetched incident once. We should probably re-fetch or update local state.
    
    state.mapOrNull(loaded: (currentState) async {
      try {
        final updatedIncident = currentState.incident.copyWith(
          status: event.newStatus,
          updated: DateTime.now(),
        );
        
        await _incidentRepo.createOrUpdate(updatedIncident);
        
        // Check for auto-tasks
        final tasks = _workflowEngine.getTasksForNewStatus(updatedIncident, event.newStatus);
        // TODO: Save tasks to repo (TaskRepository not implemented yet)
        
        emit(currentState.copyWith(
          incident: updatedIncident,
          availableActions: _workflowEngine.getAvailableNextStatuses(updatedIncident),
        ));
      } catch (e) {
        // Show error (maybe via a separate side-effect stream or just state)
      }
    });
  }

  Future<void> _onUploadDocument(UploadNewDocument event, Emitter<IncidentDetailState> emit) async {
    try {
      await _documentRepo.uploadDocument(event.file, event.metadata);
      // Stream will update the list
    } catch (e) {
      // Handle upload error
    }
  }

  @override
  Future<void> close() {
    _docSubscription?.cancel();
    return super.close();
  }
}
