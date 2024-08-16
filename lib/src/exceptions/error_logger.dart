import 'package:ecommerce_app/src/exceptions/app_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorLogger {
  void logError(dynamic error, StackTrace stackTrace) {
    debugPrint('Error: $error');
    debugPrint('Stack Trace: $stackTrace');
  }

  void logAppException(AppException exception) {
    debugPrint('AppException: $exception');
  }
}

final errorLoggerProvider = Provider((ref) => ErrorLogger());
