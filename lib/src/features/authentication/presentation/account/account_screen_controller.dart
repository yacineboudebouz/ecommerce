import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  AccountScreenController(this.authRepository)
      : super(const AsyncValue<void>.data(null));
  final FakeAuthRepository authRepository;
  Future<void> signOut() async {
    try {
      // set state to loading
      state = const AsyncValue.loading();
      // sign out (using auth repo)
      await authRepository.signOut();
      // if success, set state to data
      state = const AsyncValue<void>.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      // if error, set state to error
    }
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository);
});
