import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> postTitleMessages = {
  'ar': {
    'field_required': 'عنوان المنشور لا يمكن أن يكون فارغًا.',
    'min_length': 'عنوان المنشور يجب أن يحتوي على حرفين على الأقل.',
    'max_length': 'عنوان المنشور يجب ألا يتجاوز 100 حرف.',
  },
  'en': {
    'field_required': 'Post title cannot be empty.',
    'min_length': 'Post title must be at least 2 characters.',
    'max_length': 'Post title must not exceed 100 characters.',
  },
};

class PostTitleValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return postTitleMessages[locale]!['field_required'];
    }

    if (value.length < 2) {
      return postTitleMessages[locale]!['min_length'];
    }

    if (value.length > 100) {
      return postTitleMessages[locale]!['max_length'];
    }

    return null;
  }
}
