import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'travelland_app.dart';

void main() {
  if (kDebugMode) {
    runApp(const TravellandApp());
  } else {
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

      runApp(const TravellandApp());
    }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
  }
}
