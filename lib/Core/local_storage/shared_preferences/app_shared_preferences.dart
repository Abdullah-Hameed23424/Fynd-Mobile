import 'package:fynd/core/local_storage/shared_preferences/helper/cache_helper.dart';

/// [AppSharedPreferences]
/// A helper class for managing application-specific shared preferences.
class AppSharedPreferences {
  /// [FirstTime]
  static const String firstTime = 'firstTime';
  static bool get getFirstTime => CacheHelper.getData(key: firstTime) ?? true;
  static Future<bool> saveFirstTime(bool value) =>
      CacheHelper.saveData(key: firstTime, value: value);
  static bool get hasFirstTime => CacheHelper.contains(firstTime);
  static void removeFirstTime() => CacheHelper.removeData(key: firstTime);

  /// [temp]
  static const String locale = 'locale';
  static String get getLocale => CacheHelper.getData(key: locale) ?? 'en';
  static saveLocale(String value) =>
      CacheHelper.saveData(key: locale, value: value);
  static bool get hasLocale => CacheHelper.contains(locale);
  static void removeLocale() => CacheHelper.removeData(key: locale);
}
