import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';

class CheckAuthStatusUseCase {
  Future<bool> call() async {
    final token = await AppStorage.getToken;

    return token != null && token.isNotEmpty;
  }
}
