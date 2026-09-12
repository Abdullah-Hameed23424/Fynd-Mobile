import 'package:fynd/Core/local_storage/shared_preferences/app_shared_preferences.dart';
import 'package:fynd/core/errors/error_handler/app_error_type.dart';

class ErrorLocalizer {
  static const Map<String, Map<AppErrorType, String>> _messages = {
    'ar': <AppErrorType, String>{
      AppErrorType.unknown: 'حدث خطأ غير متوقع',
      AppErrorType.connectionTimeout: 'الخادم غير متاح',
      AppErrorType.sendTimeout: 'انتهت مهلة الاتصال',
      AppErrorType.receiveTimeout: 'الخادم غير متاح',
      AppErrorType.serverDown: 'الخادم غير متوفر حالياً',
      AppErrorType.serverError: 'حدث خطأ في الخادم',
      AppErrorType.badRequest: 'الطلب غير صالح',
      AppErrorType.unauthorized: 'الوصول غير مصرح به',
      AppErrorType.forbidden: 'ليس لديك صلاحية للوصول',
      AppErrorType.notFound: 'غير موجود',
      AppErrorType.validation: 'تحقق من البيانات المدخلة',
      AppErrorType.cancelled: 'تم إلغاء الطلب',
      AppErrorType.internet: 'تحقق من اتصالك بالإنترنت',
      AppErrorType.certificate: 'خطأ في الشهادة',
      AppErrorType.connection: 'خطأ في الاتصال',
    },
    'en': <AppErrorType, String>{
      AppErrorType.unknown: 'An unknown error occurred',
      AppErrorType.connectionTimeout: 'Server unavailable',
      AppErrorType.sendTimeout: 'Send timeout',
      AppErrorType.receiveTimeout: 'Server unavailable',
      AppErrorType.serverDown: 'Server is currently down',
      AppErrorType.serverError: 'Server error occurred',
      AppErrorType.badRequest: 'Bad request',
      AppErrorType.unauthorized: 'Unauthorized access',
      AppErrorType.forbidden: 'Access forbidden',
      AppErrorType.notFound: 'Not found',
      AppErrorType.validation: 'Validation error',
      AppErrorType.cancelled: 'Request cancelled',
      AppErrorType.internet: 'Check your internet connection',
      AppErrorType.certificate: 'Certificate error',
      AppErrorType.connection: 'Connection error',
    },
  };

  static String message(AppErrorType type) {
    final locale = AppSharedPreferences.getLocale;
    return _messages[locale]?[type] ??
        _messages['en']?[type] ??
        _messages['en']![AppErrorType.unknown]!;
  }
}
