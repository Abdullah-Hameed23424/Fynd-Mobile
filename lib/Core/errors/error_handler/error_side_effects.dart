import 'package:fynd/Core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/Core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/errors/error_handler/app_error_type.dart';

class ErrorSideEffects {
  static void handle(
    AppErrorType type,
    Object error,
    StackTrace stackTrace,
  ) async {
    switch (type) {
      case AppErrorType.unauthorized:
        if (await AppStorage.hasToken) {
          AppStorage.removeToken();
          NavigationCoordinator.toSplash();
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
