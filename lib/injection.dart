import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'data/local/isar_service.dart';
import 'data/repositories/pocketbase_auth_repository.dart';
import 'data/repositories/pocketbase_profile_repository.dart';
import 'data/repositories/pocketbase_incident_repository.dart';
import 'data/repositories/pocketbase_document_repository.dart';
import 'data/repositories/cached_incident_repository.dart';
import 'data/repositories/cached_document_repository.dart';
import 'domain/repositories/i_auth_repository.dart';
import 'domain/repositories/i_profile_repository.dart';
import 'domain/repositories/i_incident_repository.dart';
import 'domain/repositories/i_document_repository.dart';
import 'domain/workflows/workflow_engine.dart';

import 'presentation/blocs/auth/auth_bloc.dart';
import 'presentation/blocs/incident_list/incident_list_bloc.dart';
import 'presentation/blocs/incident_detail/incident_detail_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // 1. External Services
  // Replace with your actual PocketBase URL
  getIt.registerSingleton<PocketBase>(PocketBase('http://YOUR_NAS_IP:8090')); 
  
  // IsarService is initialized in main.dart
  getIt.registerSingleton<IsarService>(IsarService.instance);

  // 2. Repositories (Base)
  getIt.registerLazySingleton<PocketbaseAuthRepository>(
    () => PocketbaseAuthRepository(getIt<PocketBase>()),
  );
  getIt.registerLazySingleton<PocketbaseProfileRepository>(
    () => PocketbaseProfileRepository(getIt<PocketBase>()),
  );
  getIt.registerLazySingleton<PocketbaseIncidentRepository>(
    () => PocketbaseIncidentRepository(getIt<PocketBase>()),
  );
  getIt.registerLazySingleton<PocketbaseDocumentRepository>(
    () => PocketbaseDocumentRepository(getIt<PocketBase>()),
  );

  // 3. Repositories (Interfaces)
  getIt.registerLazySingleton<IAuthRepository>(
    () => getIt<PocketbaseAuthRepository>(),
  );
  getIt.registerLazySingleton<IProfileRepository>(
    () => getIt<PocketbaseProfileRepository>(),
  );
  
  // Use Cached Repositories for Incidents/Documents
  getIt.registerLazySingleton<IIncidentRepository>(
    () => CachedIncidentRepository(
      getIt<PocketbaseIncidentRepository>(),
      getIt<IsarService>(),
    ),
  );
  getIt.registerLazySingleton<IDocumentRepository>(
    () => CachedDocumentRepository(
      getIt<PocketbaseDocumentRepository>(),
      getIt<IsarService>(),
    ),
  );

  // 4. Logic
  getIt.registerLazySingleton<WorkflowEngine>(() => WorkflowEngine());

  // 5. BLoCs (Registered as Factories)
  getIt.registerFactory(() => AuthBloc(getIt<IAuthRepository>()));
  getIt.registerFactory(() => IncidentListBloc(getIt<IIncidentRepository>()));
  getIt.registerFactory(() => IncidentDetailBloc(
    getIt<IIncidentRepository>(),
    getIt<IDocumentRepository>(),
    getIt<WorkflowEngine>(),
  ));
}
