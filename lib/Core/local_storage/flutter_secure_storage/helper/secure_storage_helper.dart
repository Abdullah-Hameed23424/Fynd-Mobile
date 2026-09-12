import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  static Future<void> writeData({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> readData({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteData({required String key}) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }

  static Future<bool> containsKey({required String key}) async {
    return await _storage.containsKey(key: key);
  }
}
