import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FakeAuthRepository {}

void main() {
  group('AccountScreenController', () {
    test('initial state id AsyncValue.data', () {
      final authRepository = MockAuthRepository();
      final controller = AccountScreenController(authRepository);
      verifyNever((() => authRepository.signOut()));
      expect(controller.state, const AsyncValue<void>.data(null));
    });
    test('signOut success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signOut()).thenAnswer((_) => Future.value());
      final controller = AccountScreenController(authRepository);
      // run
      await controller.signOut();
      // verify
      expect(controller.debugState, const AsyncData<void>(null));
      verify(() => authRepository.signOut()).called(1);
    });
  });
}
