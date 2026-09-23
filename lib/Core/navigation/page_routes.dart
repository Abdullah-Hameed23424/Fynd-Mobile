import 'package:flutter/material.dart';
import 'package:fynd/core/navigation/routes_constants.dart';
import 'package:fynd/feature/auth/presentation/screens/Register_screen.dart';
import 'package:fynd/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:fynd/feature/auth/presentation/screens/login_screen.dart';
import 'package:fynd/feature/home/presentation/screens/home_screen.dart';
import 'package:fynd/feature/posts/presentation/screens/recent_posts_screen.dart';
import 'package:fynd/feature/splash/presentation/screens/get_start_screen.dart';
import 'package:fynd/feature/splash/presentation/screens/splash_screen.dart';

abstract class PageRoutes {
  /// Returns all static routes (without arguments)
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.splash: (_) => const SplashScreen(),
      Routes.getStart: (_) => const GetStartScreen(),
      Routes.login: (_) => const LoginScreen(),
      Routes.register: (_) => const RegisterScreen(),
      Routes.forgetPassword: (_) => const ForgetPasswordScreen(),
      Routes.home: (_) => const HomeScreen(),
      Routes.recentPosts: (_) => const RecentPostsScreen(),
    };
  }

  /// Helper method to create a simple route
  static Map<String, WidgetBuilder> createStaticRoutes(
    Map<String, WidgetBuilder> routes,
  ) {
    return routes;
  }
}
