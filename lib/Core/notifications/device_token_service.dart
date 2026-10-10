import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fynd/core/local_storage/flutter_secure_storage/app_storage.dart';
import 'package:fynd/core/network/api_endpoints.dart';
import 'package:fynd/core/network/network_client.dart';

class DeviceTokenService {
  DeviceTokenService._();

  static final DeviceTokenService instance = DeviceTokenService._();

  bool _listeningForTokenRefresh = false;

  Future<void> initializeAfterAuthentication() async {
    try {
      final accessToken = await AppStorage.getAccessToken;

      if (accessToken == null || accessToken.isEmpty) {
        log('FCM registration skipped: user is not authenticated.');
        return;
      }

      final messaging = FirebaseMessaging.instance;

      await messaging.requestPermission();

      final token = await messaging.getToken();

      if (token != null && token.isNotEmpty) {
        await _registerToken(token);
      } else {
        log('FCM registration skipped: token is unavailable.');
      }

      if (!_listeningForTokenRefresh) {
        _listeningForTokenRefresh = true;

        messaging.onTokenRefresh.listen(
          (newToken) async {
            try {
              final currentAccessToken = await AppStorage.getAccessToken;

              if (currentAccessToken == null || currentAccessToken.isEmpty) {
                log('FCM token refreshed while user is logged out.');
                return;
              }

              await _registerToken(newToken);
            } catch (e, stackTrace) {
              log(
                'Failed to register refreshed FCM token.',
                error: e,
                stackTrace: stackTrace,
              );
            }
          },
          onError: (Object error, StackTrace stackTrace) {
            log(
              'FCM token refresh listener error.',
              error: error,
              stackTrace: stackTrace,
            );
          },
        );
      }
    } catch (e, stackTrace) {
      // Notification registration must not break login.
      log('FCM device registration failed.', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _registerToken(String fcmToken) async {
    final installationId = await AppStorage.getOrCreateInstallationId();

    await NetworkClient.post(
      url: ApiEndpoints.registerDeviceToken,
      data: {'fcmToken': fcmToken, 'installationId': installationId},
    );

    log('FCM device token registered successfully.');
  }
}
