// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rxdart/rxdart.dart';

class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);
  final BehaviorSubject<T> _subject;

  Stream<T> get stream => _subject.stream;
  // getter
  T get value => _subject.value;
  // setter
  set value(T value) => _subject.add(value);
  // close the subject when ze don't need it
  void close() => _subject.close();
}
