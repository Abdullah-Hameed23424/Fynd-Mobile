import 'package:flutter/material.dart';
import 'package:fynd/Core/navigation/routes_constants.dart';
import 'package:fynd/feature/auth/presentation/screens/login_screen.dart';
import 'package:fynd/feature/home/presentation/screens/home_screen.dart';
import 'package:fynd/feature/splash/presentation/screens/splash_screen.dart';

abstract class PageRoutes {
  /// Returns all static routes (without arguments)
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.splash: (_) => const SplashScreen(),
      Routes.login: (_) => const LoginScreen(),
      Routes.home: (_) => const HomeScreen(),
    };
  }

  /// Helper method to create a simple route
  static Map<String, WidgetBuilder> createStaticRoutes(
    Map<String, WidgetBuilder> routes,
  ) {
    return routes;
  }
}
