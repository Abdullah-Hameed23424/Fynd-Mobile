class ModelParser {
  static int intValue(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? defaultValue;
  }

  static double doubleValue(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    return double.tryParse(value.toString()) ?? defaultValue;
  }

  static String stringValue(dynamic value, {String defaultValue = ''}) {
    if (value == null) return defaultValue;
    return value.toString();
  }

  static bool boolValue(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      return value == '1' ||
              value == 'yes' ||
              value == 'Yes' ||
              value == 'YES' ||
              value == 'ok' ||
              value == 'Ok' ||
              value == 'OK' ||
              value == 'true'
          ? true
          : false;
    }
    return defaultValue;
  }

  static DateTime? dateTimeValue(dynamic value, {DateTime? defaultValue}) {
    if (value == null) {
      return null;
    }
    if (value is DateTime) return value;
    return DateTime.tryParse(value.toString());
  }

  static List<T> listValue<T>(
    dynamic value,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (value == null || value is! List) return [];
    return value.map((e) => fromJson(e as Map<String, dynamic>)).toList();
  }

  static Map<String, dynamic> mapValue(dynamic value) {
    if (value == null || value is! Map<String, dynamic>) return {};
    return value;
  }
}
