import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> postDescriptionMessages = {
  'ar': {
    'field_required': 'وصف المنشور لا يمكن أن يكون فارغًا.',
    'min_length': 'وصف المنشور يجب أن يحتوي على 5 أحرف على الأقل.',
    'max_length': 'وصف المنشور يجب ألا يتجاوز 1000 حرف.',
  },
  'en': {
    'field_required': 'Post description cannot be empty.',
    'min_length': 'Post description must be at least 5 characters.',
    'max_length': 'Post description must not exceed 1000 characters.',
  },
};

class PostDescriptionValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return postDescriptionMessages[locale]!['field_required'];
    }

    if (value.length < 5) {
      return postDescriptionMessages[locale]!['min_length'];
    }

    if (value.length > 1000) {
      return postDescriptionMessages[locale]!['max_length'];
    }

    return null;
  }
}
