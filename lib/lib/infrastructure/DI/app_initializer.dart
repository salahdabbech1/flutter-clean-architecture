import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../networking/local/key_value_storage_base.dart';
import '../networking/local/path_provider_service.dart';
import 'injecatable_config.dart';

class AppInitializer {
  /// Initializer for important and asyncronous app services
  /// Should be called in main after `WidgetsBinding.FlutterInitialized()`.
  ///
  /// [mainAppWidget] is the first widget that loads on app startup.
  /// [runApp] is the main app binding method that launches our [mainAppWidget].
  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    // For preparing the key-value mem cache
    await KeyValueStorageBase.init();

    // For preparing to read application directory paths
    await PathProviderService.init();

    // For prettyifying console debug messages
    debugPrint = _prettifyDebugPrint;
    // for initializing the injectable config
    configureDependencies();

    runApp(mainAppWidget);
  }

  static void _prettifyDebugPrint(String? message, {int? wrapWidth}) {
    final date = DateTime.now();
    var msg = '${date.year}/${date.month}/${date.day}';
    msg += ' ${date.hour}:${date.minute}:${date.second}';
    msg += ' $message';
    debugPrintSynchronously(msg, wrapWidth: wrapWidth);
  }
}
