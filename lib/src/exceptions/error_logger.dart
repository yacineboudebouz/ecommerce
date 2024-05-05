import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorLogger {
  void logError(dynamic error, StackTrace stackTrace) {
    debugPrint('Error: $error');
    debugPrint('Stack Trace: $stackTrace');
  }
}

final errorLoggerProvider = Provider((ref) => ErrorLogger());
