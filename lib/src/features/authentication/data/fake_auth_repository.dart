import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/utils/typedef.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthRepository {
  FutureVoid signInWithEmailAndPassword(String email, String password) async {
    /// TODO: implement
  }
  FutureVoid createUserWithEmailAndPassword(
      String email, String password) async {
    /// TODO: implement
  }

  FutureVoid signOut() async {
    /// TODO: implement
  }

  Stream<AppUser?> authStateChanges() => Stream.value(null);
  AppUser? get currentUser => null;
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
