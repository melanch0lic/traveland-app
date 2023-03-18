import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'travelland_app.dart';

Future<void> main() async {
  if (kDebugMode) {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    runApp(EasyLocalization(
      path: 'lang',
      supportedLocales: const [Locale('en'), Locale('ru')],
      fallbackLocale: const Locale('ru'),
      child: const TravellandApp(),
    ));
  } else {
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await EasyLocalization.ensureInitialized();

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

      runApp(EasyLocalization(
        path: 'lang',
        supportedLocales: const [Locale('en'), Locale('ru')],
        fallbackLocale: const Locale('ru'),
        child: const TravellandApp(),
      ));
    }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
  }
}
