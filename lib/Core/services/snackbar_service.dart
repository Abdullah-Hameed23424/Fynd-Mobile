import 'package:flutter/material.dart';
import 'package:fynd/core/navigation/navigation_service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/// --------------------------------------------------------------------------
///   SNACKBAR ENUMS
/// --------------------------------------------------------------------------
enum SnackBarType { success, error, warning, info }

/// --------------------------------------------------------------------------
///   SNACKBAR SERVICE
/// --------------------------------------------------------------------------
class SnackBarService {
  // Singleton Setup
  static final SnackBarService _instance = SnackBarService._internal();
  factory SnackBarService() => _instance;
  SnackBarService._internal();

  /// Helper to get current overlay state
  OverlayState get _overlay =>
      NavigationService.navigatorKey.currentState!.overlay!;

  ///   CORE SHOW METHOD
  void show({
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 2),
  }) {
    switch (type) {
      case SnackBarType.success:
        showTopSnackBar(_overlay, CustomSnackBar.success(message: message));
        break;

      case SnackBarType.error:
        showTopSnackBar(
          _overlay,
          CustomSnackBar.error(message: message, maxLines: 3),
        );
        break;

      case SnackBarType.warning:
        showTopSnackBar(
          _overlay,
          CustomSnackBar.info(message: message, backgroundColor: Colors.orange),
        );
        break;

      case SnackBarType.info:
        showTopSnackBar(_overlay, CustomSnackBar.info(message: message));
        break;
    }
  }

  ///   QUICK HELPERS
  void showSuccess({required String message}) =>
      show(message: message, type: SnackBarType.success);

  void showError({required String message}) =>
      show(message: message, type: SnackBarType.error);

  void showWarning({required String message}) =>
      show(message: message, type: SnackBarType.warning);

  void showInfo({required String message}) =>
      show(message: message, type: SnackBarType.info);
}

/// Global Instance
final SnackBarService snackBarService = SnackBarService();
