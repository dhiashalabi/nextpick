import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'settings/settings_controller.dart';
import 'l10n/ln10.dart';

class NextPickApp extends StatelessWidget {
  const NextPickApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          themeMode: settingsController.themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const Placeholder(),
        );
      },
    );
  }
}
