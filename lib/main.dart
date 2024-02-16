import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nextpick/src/app.dart';

import 'firebase_options.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instanceFor(app: app);

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(NextPickApp(settingsController: settingsController));
}
