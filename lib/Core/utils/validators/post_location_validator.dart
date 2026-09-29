import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> postLocationMessages = {
  'ar': {
    'field_required': 'الموقع لا يمكن أن يكون فارغًا.',
    'min_length': 'الموقع يجب أن يحتوي على حرفين على الأقل.',
    'max_length': 'الموقع يجب ألا يتجاوز 200 حرف.',
  },
  'en': {
    'field_required': 'Location cannot be empty.',
    'min_length': 'Location must be at least 2 characters.',
    'max_length': 'Location must not exceed 200 characters.',
  },
};

class PostLocationValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return postLocationMessages[locale]!['field_required'];
    }

    if (value.length < 2) {
      return postLocationMessages[locale]!['min_length'];
    }

    if (value.length > 200) {
      return postLocationMessages[locale]!['max_length'];
    }

    return null;
  }
}
