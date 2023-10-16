import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:ecommerce_app/src/utils/typedef.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  FutureVoid signInWithEmailAndPassword(String email, String password) async {
    if (currentUser == null) {
      _authState.value =
          AppUser(uid: email.split('').reversed.join(), email: email);
    }
  }

  FutureVoid createUserWithEmailAndPassword(
      String email, String password) async {
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  void _createNewUser(String email) {
    _authState.value =
        AppUser(uid: email.split('').reversed.join(), email: email);
  }

  FutureVoid signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  final auth = FakeAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
