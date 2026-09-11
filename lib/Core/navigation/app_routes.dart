import 'package:flutter/material.dart';
import 'page_routes.dart';
import 'dynamic_routes.dart';
import 'route_observer.dart';

/// App Routes Configuration
/// Central configuration for all routing in the app
/// Uses clean separation of concerns pattern

class AppRoutes {
  /// Get all static routes
  static Map<String, WidgetBuilder> getRoutes() => PageRoutes.getRoutes();

  /// Handle dynamic routes with arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      DynamicRoutes.safeOnGenerateRoute(settings);

  /// Get route observer for navigation tracking
  static NavigatorObserver getRouteObserver() => AppRouteObserver();
}
