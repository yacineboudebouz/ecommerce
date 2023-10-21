Future<void> delay(bool addDelay, [int milliseconds = 200]) async {
  if (addDelay) {
    return Future.delayed(Duration(microseconds: milliseconds));
  } else {
    return Future.value();
  }
}
