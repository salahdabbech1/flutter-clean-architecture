import 'package:flutter/material.dart';
import 'lib/infrastructure/DI/app_initializer.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.init(
    mainAppWidget: const MyApp(),
    runApp: runApp,
  );
}
