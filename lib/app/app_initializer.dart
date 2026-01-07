import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/error/global_error_widget.dart';
import 'woodoo_app.dart';

class AppInitializer {
  const AppInitializer._();

  static void run() {
    runZonedGuarded(
          () {
        WidgetsFlutterBinding.ensureInitialized();
        _setupErrorHandling();
        runApp(
          const ProviderScope(
            child: WoodooApp(),
          ),
        );
      },
          (error, stackTrace) {
        _reportZoneError(error, stackTrace);
      },
    );
  }

  static void _setupErrorHandling() {
    /// Flutter framework errors (build/layout/paint)
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      _reportFlutterError(details);
    };

    /// Widget rendering fallback (safe UI)
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return GlobalErrorWidget(details: details);
    };
  }

  static void _reportFlutterError(FlutterErrorDetails details) {
    // TODO: Hook Crashlytics / Sentry / Datadog
    if (kDebugMode) {
      debugPrint('FlutterError: ${details.exception}');
      debugPrintStack(stackTrace: details.stack);
    }
  }

  static void _reportZoneError(Object error, StackTrace stackTrace) {
    // TODO: Hook Crashlytics / Sentry / Datadog
    if (kDebugMode) {
      debugPrint('ZoneError: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
