class AppConfig {
  // API Configuration
  static const String domain = 'http://fynd.runasp.net/';
  static const String baseUrl = '$domain/api/';
  static const String storageUrl = '$domain/storage/';
  static const int apiTimeout = 30; // seconds

  // App Configuration
  static const String appName = 'Fynd';
  static const String appVersion = '1.0.0';

  // Cache Configuration
  static const int maxCacheSize = 100; // MB
  static const Duration cacheExpiration = Duration(days: 7);

  // Pagination Configuration
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // UI Configuration

  static const String defaultFontFamily = 'Inter';
  static const String defaultLocale = 'en';

  /// Check if running in debug mode
  static bool get isDebugMode {
    return const bool.fromEnvironment('dart.vm.product') == false;
  }
}
