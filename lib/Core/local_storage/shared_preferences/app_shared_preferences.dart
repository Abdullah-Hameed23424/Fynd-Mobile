import 'package:fynd/core/local_storage/shared_preferences/helper/cache_helper.dart';

/// [AppSharedPreferences]
/// A helper class for managing application-specific shared preferences.
class AppSharedPreferences {
  /// [token]
  static String token = 'token';
  static String get getToken => CacheHelper.getData(key: token) ?? 'no token';
  static saveToken(String value) =>
      CacheHelper.saveData(key: token, value: value);
  static bool get hasToken => CacheHelper.contains(token);
  static Future<void> removeToken() async =>
      await CacheHelper.removeData(key: token);

  /// [uid]
  static String uid = 'uid';
  static int get getMyId => CacheHelper.getData(key: uid) ?? 0;
  static saveMyId(int value) => CacheHelper.saveData(key: uid, value: value);
  static bool get hasMyId => CacheHelper.contains(uid);
  static void removeMyId() => CacheHelper.removeData(key: uid);

  /// [temp]
  static const String locale = 'locale';
  static String get getLocale => CacheHelper.getData(key: locale) ?? 'en';
  static saveLocale(String value) =>
      CacheHelper.saveData(key: locale, value: value);
  static bool get hasLocale => CacheHelper.contains(locale);
  static void removeLocale() => CacheHelper.removeData(key: locale);
}
