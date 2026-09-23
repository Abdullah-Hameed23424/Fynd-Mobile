import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> passwordMessages = {
  'ar': {
    'field_required': 'كلمة المرور لا يمكن أن تكون فارغة.',
    'password_invalid':
        'كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل، وتتضمن أحرفًا وأرقامًا.',
  },
  'en': {
    'field_required': 'Password cannot be empty',
    'password_invalid': 'Use 8+ characters with letters and numbers',
  },
};

class PasswordValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;
    value = value?.trim();

    if (value == null || value.isEmpty) {
      return passwordMessages[locale]!['field_required'];
    }

    final bool hasMinLength = value.length >= 8;
    final bool hasLetter = RegExp(r'[A-Za-z]').hasMatch(value);
    final bool hasNumber = RegExp(r'\d').hasMatch(value);

    if (!hasMinLength || !hasLetter || !hasNumber) {
      return passwordMessages[locale]!['password_invalid'];
    }

    return null;
  }
}
