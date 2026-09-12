import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

/// This map for translation
const Map<String, Map<String, String>> emailMessages = {
  'ar': {
    'field_required': 'البريد الإلكتروني لا يمكن أن يكون فارغًا.',
    'invalid_email': 'يرجى إدخال بريد إلكتروني صالح.',
  },
  'en': {
    'field_required': 'Email cannot be empty.',
    'invalid_email': 'Please enter a valid email address.',
  },
};

/// [EmailValidator]
/// This class is responsible for validation in `email` TextField
class EmailValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return emailMessages[locale]!['field_required'];
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return emailMessages[locale]!['invalid_email'];
    }

    return null;
  }
}
