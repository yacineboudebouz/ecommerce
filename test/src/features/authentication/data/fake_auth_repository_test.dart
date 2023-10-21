import 'dart:math';

import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  final testUser =
      AppUser(uid: testEmail.split('').reversed.join(), email: testEmail);
  FakeAuthRepository makeFakeAuthRepository() =>
      FakeAuthRepository(addDelay: false);
  group('FakeAuthRepository', () {
    test('currentUser is null', () {
      final authRepository = makeFakeAuthRepository();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('currentUser is not null after sign in', () async {
      final authRepository = makeFakeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      expect(authRepository.currentUser, testUser);
    });
    test('currentUser is not null after registration', () async {
      final authRepository = makeFakeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      expect(authRepository.currentUser, testUser);
    });
    test('currentUser is not null after signOut', () async {
      final authRepository = makeFakeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      expect(
          authRepository.authStateChanges(),
          emitsInAnyOrder([
            testUser,
            null,
          ]));
      await authRepository.signOut();
    });
    test('sign in after dispose throws exepction', () {
      final authRepository = makeFakeAuthRepository();
      authRepository.dispose();
      expect(
          () => authRepository.signInWithEmailAndPassword(
              testEmail, testPassword),
          throwsStateError);
    });
  });
}
