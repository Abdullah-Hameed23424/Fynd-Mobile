/// [ApiEndpoints]
/// Contains the endpoints for the API used in the app.
class ApiEndpoints {
  /// [Auth]
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String forgetPassword = 'auth/forgot-password';
  static const String otp = 'auth/verify-otp';
  static const String resetPassword = 'auth/reset-password';
  static const String refreshToken = 'auth/refresh';

  /// [Home]
  static const String home = 'home';

  /// [Posts]
  static const String recentPosts = 'post/recent';
  static const String posts = 'post/all';
  static const String categories = 'category';
  static const String createPost = 'post/create';
  static const String myPosts = 'post/my-own';
  static const String postDetails = 'post/details';

  static const String testEndpoint = 'test';
  static String testEndpointByAttribute({required Object id}) =>
      'test/$id/test(maybe)';
}
