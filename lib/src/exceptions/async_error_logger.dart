import 'package:ecommerce_app/src/exceptions/app_exception.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase, Object? previousValue, Object? newValue,
      ProviderContainer container) {
    final error = _findError(newValue);
    if (error != null) {
      if (error.error is AppException) {
        debugPrint(error.error.toString());
      } else {
        debugPrint(error.toString());
      }
    }
  }
}

AsyncError<dynamic>? _findError(Object? value) {
  if (value is EmailPasswordSignInState && value.value is AsyncError) {
    return value.value as AsyncError;
  } else if (value is AsyncError) {
    return value;
  } else {
    return null;
  }
}
