import 'package:fynd/core/errors/error_handler/app_error_type.dart';
import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/network/network_client.dart';

class ErrorSideEffects {
  static void handle(
    AppErrorType type,
    Object error,
    StackTrace stackTrace,
  ) async {
    switch (type) {
      case AppErrorType.unauthorized:
        if (await AppStorage.hasAccessToken) {
          await AppStorage.removeAccessToken();
          await AppStorage.removeRefreshToken();
          NetworkClient.clearAuthToken();
          NavigationCoordinator.toLogin();
        }
        break;

      case AppErrorType.badRequest:
        break;

      case AppErrorType.serverDown:
        break;

      case AppErrorType.serverError:
        break;

      case AppErrorType.forbidden:
        break;

      case AppErrorType.notFound:
        break;

      case AppErrorType.validation:
        break;

      case AppErrorType.unknown:
        break;

      default:
        break;
    }
  }
}
