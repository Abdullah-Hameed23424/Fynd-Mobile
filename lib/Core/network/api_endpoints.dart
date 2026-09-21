/// [ApiEndpoints]
/// Contains the endpoints for the API used in the app.
class ApiEndpoints {
  /// [Auth]
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String forgetPassword = 'auth/forgot-password';
  static const String otp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';

  /// [Auth]
  static const String home = 'home';

  static const String testEndpoint = 'test';
  static String testEndpointByAttribute({required Object id}) =>
      'test/$id/test(maybe)';
}
