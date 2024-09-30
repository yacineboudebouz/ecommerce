import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'date_formatter.g.dart';

@riverpod
DateFormat dateFormatter(DateFormatterRef ref) {
  /// Date formatter to be used in the app.
  return DateFormat.MMMEd();
}


// final dateFormatterProvider = Provider<DateFormat>((ref) {
//   /// Date formatter to be used in the app.
//   return DateFormat.MMMEd();
// });
