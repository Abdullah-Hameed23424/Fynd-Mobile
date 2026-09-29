import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

const Map<String, Map<String, String>> emptyMessages = {
  'ar': {'field_required': 'هذا الحقل لا يمكن أن يكون فارغًا.'},
  'en': {'field_required': 'This field cannot be empty.'},
};

class EmptyValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return emptyMessages[locale]!['field_required'];
    }

    return null;
  }
}
