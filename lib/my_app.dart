import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lib/infrastructure/DI/app_bloc_provider.dart';
import 'lib/infrastructure/helpers/constants/app_colors.dart';
import 'lib/infrastructure/helpers/constants/app_themes.dart';
import 'lib/infrastructure/routing/auto_router_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Perro';
    const showDebugBanner = false;
    final platformIsIOS = Platform.isIOS;
    final _appRouter = AppRouter();
    final app = platformIsIOS
        ? Theme(
            data: AppThemes.mainTheme,
            child: CupertinoApp.router(
              title: title,
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: showDebugBanner,
            ),
          )
        : MaterialApp.router(
            title: title,
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: showDebugBanner,
            color: AppColors.primaryColor,
            theme: AppThemes.mainTheme,
          );
    return MultiBlocProvider(providers: appProviders, child: app);
  }
}
