import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartupState {
  const AppStartupState({
    required this.localDatabaseTarget,
    required this.mode,
    required this.homeHubStatus,
  });

  final String localDatabaseTarget;
  final String mode;
  final String homeHubStatus;
}

final appStartupStateProvider = Provider<AppStartupState>(
  (ref) => const AppStartupState(
    localDatabaseTarget: 'SQLite + Drift',
    mode: 'Local only',
    homeHubStatus: 'Not paired',
  ),
);

Future<AppStartupState> prepareAppStartup() async {
  return const AppStartupState(
    localDatabaseTarget: 'SQLite + Drift',
    mode: 'Local only',
    homeHubStatus: 'Not paired',
  );
}
