import 'dart:developer';

import 'package:fynd/core/navigation/route_arguments.dart';

import 'navigation_service.dart';
import 'routes_constants.dart';
import 'route_guards.dart';

abstract class NavigationCoordinator {
  // ========== Splash ==========
  static Future<dynamic>? toSplash() {
    return NavigationService.navigateAndRemoveUntil(Routes.splash);
  }

  // ========== Auth ==========
  static Future<dynamic>? toLogin() {
    return NavigationService.navigateAndRemoveUntil(Routes.login);
  }

  static Future<dynamic>? toRegister() {
    return NavigationService.navigateAndRemoveUntil(Routes.register);
  }

  static Future<dynamic>? toForgetPassword() {
    return NavigationService.navigateTo(Routes.forgetPassword);
  }

  static Future<dynamic>? toOtp({required OtpArguments args}) {
    return NavigationService.navigateTo(Routes.otp, arguments: args);
  }

  // ========== Auth ==========
  static Future<dynamic>? toHome() {
    return NavigationService.navigateAndRemoveUntil(Routes.home);
  }

  // ========== HELPER METHODS ==========
  static void goBack<T extends Object?>([T? result]) {
    NavigationService.goBack(result);
  }

  static Future<dynamic>? push(String routeName, {Object? arguments}) {
    return NavigationService.navigateTo(routeName, arguments: arguments);
  }

  static Future<dynamic>? replace(String routeName, {Object? arguments}) {
    return NavigationService.navigateAndReplace(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic>? removeAllAndPush(
    String routeName, {
    Object? arguments,
  }) {
    return NavigationService.navigateAndRemoveUntil(
      routeName,
      arguments: arguments,
    );
  }

  // ========== GUARDED NAVIGATION ==========
  static Future<dynamic>? toProtectedRoute(
    String routeName, {
    required RouteGuard guard,
    Object? arguments,
  }) async {
    final canNavigate = await guard.canActivate();
    if (!canNavigate) {
      _showBlockedMessage(guard.blockedMessage);
      return null;
    }
    return NavigationService.navigateTo(routeName, arguments: arguments);
  }

  static void _showBlockedMessage(String message) {
    log('🚫 Navigation blocked: $message');
  }
}
