import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> confirmPasswordMessages = {
  'ar': {
    'field_required': 'تأكيد كلمة المرور لا يمكن أن يكون فارغًا.',
    'password_not_match': 'كلمة المرور غير متطابقة.',
  },
  'en': {
    'field_required': 'Confirm password cannot be empty.',
    'password_not_match': 'Passwords do not match.',
  },
};

class ConfirmPasswordValidator {
  static String? validate(String? value, String? password) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();
    password = password?.trim();

    if (value == null || value.isEmpty) {
      return confirmPasswordMessages[locale]!['field_required'];
    }

    if (value != password) {
      return confirmPasswordMessages[locale]!['password_not_match'];
    }

    return null;
  }
}
