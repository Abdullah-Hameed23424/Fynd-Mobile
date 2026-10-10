import 'package:fynd/core/local_storage/flutter_secure_storage/helper/secure_storage_helper.dart';
import 'dart:math';

class AppStorage {
  /// Token
  static const String accessToken = 'accessToken';
  static Future<String?> get getAccessToken async =>
      SecureStorageHelper.readData(key: accessToken);
  static Future<void> saveAccessToken(String value) async =>
      SecureStorageHelper.writeData(key: accessToken, value: value);
  static Future<bool> get hasAccessToken async =>
      SecureStorageHelper.containsKey(key: accessToken);
  static Future<void> removeAccessToken() async =>
      SecureStorageHelper.deleteData(key: accessToken);

  static const String refreshToken = 'refreshToken';
  static Future<String?> get getRefreshToken async =>
      SecureStorageHelper.readData(key: refreshToken);
  static Future<void> saveRefreshToken(String value) async =>
      SecureStorageHelper.writeData(key: refreshToken, value: value);
  static Future<bool> get hasRefreshToken async =>
      SecureStorageHelper.containsKey(key: refreshToken);
  static Future<void> removeRefreshToken() async =>
      SecureStorageHelper.deleteData(key: refreshToken);

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

  /// Device Installation ID
  static const String installationId = 'fynd-installation-id';
  static Future<String?> get getInstallationId async =>
      SecureStorageHelper.readData(key: installationId);
  static Future<void> saveInstallationId(String value) async =>
      SecureStorageHelper.writeData(key: installationId, value: value);
  static Future<String> getOrCreateInstallationId() async {
    final existing = await getInstallationId;
    if (existing != null && existing.isNotEmpty) {
      return existing;
    }
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    final id = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    await saveInstallationId(id);
    return id;
  }
}
