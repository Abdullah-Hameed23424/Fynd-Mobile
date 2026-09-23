import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

class FirstTimeUseUseCase {
  Future<bool> call() async {
    final bool firstTime = AppSharedPreferences.getFirstTime;

    return firstTime;
  }
}
