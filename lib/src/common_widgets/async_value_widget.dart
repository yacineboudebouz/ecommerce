// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/src/common_widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        error: ((error, stackTrace) =>
            Center(child: ErrorMessageWidget(error.toString()))),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
