import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

/// This map for translation
const Map<String, Map<String, String>> fullNameMessages = {
  'ar': {
    'field_required': 'الاسم الكامل لا يمكن أن يكون فارغًا.',
    'invalid_full_name': 'يرجى إدخال اسم كامل صالح.',
  },
  'en': {
    'field_required': 'Full name cannot be empty.',
    'invalid_full_name': 'Please enter a valid full name.',
  },
};

/// [FullNameValidator]
/// This class is responsible for validation in `Full Name` TextField
class FullNameValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return fullNameMessages[locale]!['field_required'];
    }

    // At least 2 words, each word contains letters.
    final fullNameRegex = RegExp(
      r'^[a-zA-Z\u0600-\u06FF]+(?:\s+[a-zA-Z\u0600-\u06FF]+)+$',
    );

    if (!fullNameRegex.hasMatch(value)) {
      return fullNameMessages[locale]!['invalid_full_name'];
    }

    return null;
  }
}
