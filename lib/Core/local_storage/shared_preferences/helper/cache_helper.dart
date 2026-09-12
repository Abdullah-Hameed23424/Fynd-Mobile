import 'package:shared_preferences/shared_preferences.dart';

/// [CacheHelper]
/// A helper class for managing local storage using SharedPreferences.
class CacheHelper {
  static late SharedPreferences sharedPreferences;

  /// [init]
  /// Initializes the SharedPreferences instance.
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// [saveData]
  /// Saves data to SharedPreferences based on the type of the value.
  static Future<bool> saveData({required String key, required value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  /// [getData]
  /// Retrieves data from SharedPreferences based on the key.
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  /// [contains]
  /// Checks if the SharedPreferences contains the specified key.
  static bool contains(String key) {
    return sharedPreferences.containsKey(key);
  }

  /// [removeData]
  /// Removes data from SharedPreferences based on the key.
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  /// [removeAllData]
  /// Clears all data from SharedPreferences.
  static Future<bool> removeAllData() async {
    return await sharedPreferences.clear();
  }
}
