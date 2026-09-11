// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'routes_constants.dart';
import 'route_arguments.dart';

/// Dynamic Routes Generator
/// Handles routes with dynamic arguments and parameters

abstract class DynamicRoutes {
  /// Generate route with custom animations and argument handling
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // Product Detail Route
      // case Routes.test:
      //   if (args is ProductDetailArguments) {
      //     // TODO: Uncomment when ProductDetailPage is available
      //     // return PageTransitions.slideFromRightTransition(
      //     //   ProductDetailPage(arguments: args),
      //     //   settings,
      //     // );
      //   }
      //   break;

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
