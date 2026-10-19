import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';

/// This map for translation
const Map<String, Map<String, String>> phoneNumberMessages = {
  'ar': {
    'field_required': 'رقم الهاتف لا يمكن أن يكون فارغًا.',
    'invalid_phone_number': 'يرجى إدخال رقم هاتف صالح.',
  },
  'en': {
    'field_required': 'Phone number cannot be empty.',
    'invalid_phone_number': 'Please enter a valid phone number.',
  },
};

/// [PhoneNumberValidator]
/// This class is responsible for validation in `Phone Number` TextField
class PhoneNumberValidator {
  static String? validate(String? value) {
    final String locale = AppSharedPreferences.getLocale;

    value = value?.trim();

    if (value == null || value.isEmpty) {
      return phoneNumberMessages[locale]!['field_required'];
    }

    // Accepts Syrian mobile numbers with or without the country code.
    // Examples: 09XXXXXXXX, +9639XXXXXXXX, 9639XXXXXXXX
    final phoneNumberRegex = RegExp(r'^(?:\+?963|0)9[0-9]{8}$');

    if (!phoneNumberRegex.hasMatch(value)) {
      return phoneNumberMessages[locale]!['invalid_phone_number'];
    }

    return null;
  }
}
