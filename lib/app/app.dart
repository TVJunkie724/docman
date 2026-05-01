import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/theme/app_theme.dart';
import 'bootstrap/app_startup.dart';

class DocManApp extends ConsumerWidget {
  const DocManApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'DocMan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const FoundationStatusScreen(),
    );
  }
}

class FoundationStatusScreen extends ConsumerWidget {
  const FoundationStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupState = ref.watch(appStartupStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Foundation Status')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              'R2 Technical Foundation',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Working foundation surface. This is not the final MVP UI.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            StatusTile(
              label: 'Local database',
              value: startupState.localDatabaseTarget,
              semanticDescription:
                  'Target local database is SQLite with Drift.',
            ),
            StatusTile(
              label: 'Mode',
              value: startupState.mode,
              semanticDescription: 'The app starts in local only mode.',
            ),
            StatusTile(
              label: 'Home Hub',
              value: startupState.homeHubStatus,
              semanticDescription: 'No Home Hub is paired yet.',
            ),
            const StatusTile(
              label: 'Secrets',
              value: 'Secure Storage boundary planned',
              semanticDescription:
                  'Secrets are planned for secure storage only.',
            ),
            const StatusTile(
              label: 'Logging',
              value: 'Sensitive values redacted',
              semanticDescription:
                  'Logs must not contain document contents or secrets.',
            ),
            const SizedBox(height: 16),
            Text(
              'Legacy spike screens remain isolated until their features are migrated.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusTile extends StatelessWidget {
  const StatusTile({
    super.key,
    required this.label,
    required this.value,
    required this.semanticDescription,
  });

  final String label;
  final String value;
  final String semanticDescription;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticDescription,
      child: Card(
        child: ListTile(
          title: Text(label),
          subtitle: Text(value),
          leading: const Icon(Icons.check_circle_outline),
        ),
      ),
    );
  }
}
