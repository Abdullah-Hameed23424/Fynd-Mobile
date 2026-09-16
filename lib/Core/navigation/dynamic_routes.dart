// ignore_for_file: unused_import, always_use_package_imports

import 'package:flutter/material.dart';
import 'package:fynd/feature/auth/presentation/screens/otp_screen.dart';
import 'package:fynd/feature/auth/presentation/screens/reset_password_screen.dart';
import 'package:fynd/feature/home/presentation/screens/nav_bar_screen.dart';
import 'routes_constants.dart';
import 'route_arguments.dart';

/// Dynamic Routes Generator
/// Handles routes with dynamic arguments and parameters

abstract class DynamicRoutes {
  /// Generate route with custom animations and argument handling
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.otp:
        if (args is OtpArguments) {
          return MaterialPageRoute(
            builder: (_) => OtpScreen(email: args.email),
          );
        }
        break;

      case Routes.resetPassword:
        if (args is ResetPasswordArguments) {
          return MaterialPageRoute(
            builder: (_) => ResetPasswordScreen(resetToken: args.resetToken),
          );
        }
        break;

      case Routes.navBar:
        if (args is NavBarArguments) {
          return MaterialPageRoute(
            builder: (_) => NavBarScreen(index: args.index),
          );
        }
        break;

      // 404 Not Found
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                '❌ No route defined for ${settings.name}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }

    // ignore: dead_code
    return null;
  }

  /// Safe route generation with error handling
  static Route<dynamic>? safeOnGenerateRoute(RouteSettings settings) {
    try {
      return onGenerateRoute(settings);
    } catch (e) {
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              '❌ Error navigating to ${settings.name}\n$e',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
  }
}
