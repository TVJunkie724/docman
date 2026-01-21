import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/incident.dart';
import '../../../domain/repositories/i_incident_repository.dart';

part 'incident_list_event.dart';
part 'incident_list_state.dart';
part 'incident_list_bloc.freezed.dart';

class IncidentListBloc extends Bloc<IncidentListEvent, IncidentListState> {
  final IIncidentRepository _repository;
  StreamSubscription<List<Incident>>? _subscription;

  IncidentListBloc(this._repository) : super(const IncidentListState.initial()) {
    on<LoadIncidents>(_onLoadIncidents);
    on<IncidentsUpdated>(_onIncidentsUpdated);
    on<IncidentsError>(_onIncidentsError);
  }

  Future<void> _onLoadIncidents(LoadIncidents event, Emitter<IncidentListState> emit) async {
    emit(const IncidentListState.loading());
    await _subscription?.cancel();
    
    _subscription = _repository.watchIncidents(
      profileId: event.profileId,
      tag: event.tag,
    ).listen(
      (incidents) => add(IncidentListEvent.updated(incidents)),
      onError: (e) => add(IncidentListEvent.error(e.toString())),
    );
  }

  void _onIncidentsUpdated(IncidentsUpdated event, Emitter<IncidentListState> emit) {
    emit(IncidentListState.loaded(event.incidents));
  }

  void _onIncidentsError(IncidentsError event, Emitter<IncidentListState> emit) {
    emit(IncidentListState.failure(event.message));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
