import 'package:fynd/core/local_storage/flutter_secure_storage/helper/secure_storage_helper.dart';

class AppStorage {
  /// Token
  static const String token = 'token';
  static Future<String?> get getToken async =>
      SecureStorageHelper.readData(key: token);
  static Future<void> saveToken(String value) async =>
      SecureStorageHelper.writeData(key: token, value: value);
  static Future<bool> get hasToken async =>
      SecureStorageHelper.containsKey(key: token);
  static Future<void> removeToken() async =>
      SecureStorageHelper.deleteData(key: token);

  /// User ID
  static const String myId = 'my-id';
  static Future<int?> get getMyId async {
    final value = await SecureStorageHelper.readData(key: myId);
    if (value == null) return null;
    return int.tryParse(value);
  }

  static Future<void> saveMyId(int value) async =>
      SecureStorageHelper.writeData(key: myId, value: value.toString());
  static Future<bool> get hasMyId async =>
      SecureStorageHelper.containsKey(key: myId);
  static Future<void> removeMyId() async =>
      SecureStorageHelper.deleteData(key: myId);
}
