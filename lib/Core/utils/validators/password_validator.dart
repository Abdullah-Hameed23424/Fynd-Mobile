import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> passwordMessages = {
  'ar': {
    'field_required': 'كلمة المرور لا يمكن أن تكون فارغة.',
    'password_min_length': 'كلمة المرور يجب أن تكون 8 أحرف على الأقل.',
  },
  'en': {
    'field_required': 'cannot be empty',
    'password_min_length': 'must be at least 8 characters',
  },
};

class PasswordValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return passwordMessages[locale]!['field_required'];
    } else if (value.length < 8) {
      return passwordMessages[locale]!['password_min_length'];
    }

    return null;
  }
}
