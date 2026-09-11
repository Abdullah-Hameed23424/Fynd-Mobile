import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/Core/navigation/app_routes.dart';
import 'package:fynd/Core/navigation/navigation_service.dart';
import 'package:fynd/Core/navigation/routes_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          debugShowCheckedModeBanner: true,
        );
      },
    );
  }
}
