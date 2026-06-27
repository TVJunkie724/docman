import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';
import 'app_startup.dart';

Future<void> bootstrapApp() async {
  final startupState = await prepareAppStartup();

  runApp(
    ProviderScope(
      overrides: [appStartupStateProvider.overrideWithValue(startupState)],
      child: const DocManApp(),
    ),
  );
}
