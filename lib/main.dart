import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/core/local_storage/shared_preferences/helper/cache_helper.dart';
import 'package:fynd/core/navigation/app_routes.dart';
import 'package:fynd/core/navigation/navigation_service.dart';
import 'package:fynd/core/navigation/routes_constants.dart';
import 'package:fynd/core/network/network_client.dart';
import 'package:fynd/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeServices();
  runApp(const MyApp());
}

Future<void> _initializeServices() async {
  await CacheHelper.init();
  await NetworkClient.init();
  _logDebugInfo();
}

void _logDebugInfo() async {
  log('Token: ${await AppStorage.getToken}');
  log('Has token: ${await AppStorage.hasToken}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          title: 'Fynd',
          routes: AppRoutes.getRoutes(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          navigatorObservers: [AppRoutes.getRouteObserver()],
          initialRoute: Routes.splash,
          navigatorKey: NavigationService.navigatorKey,
          theme: AppTheme.lightTheme(context),
          debugShowCheckedModeBanner: true,
        );
      },
    );
  }
}
