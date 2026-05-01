import 'package:flutter/material.dart';
import 'app/bootstrap/app_bootstrap.dart';

// Global Theme Notifier (Simple State Management)
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrapApp();
}
