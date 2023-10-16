import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<AsyncValue> {
  AccountScreenController(this.authRepository)
      : super(const AsyncValue.data(null));
  final FakeAuthRepository authRepository;
  Future<bool> signOut() async {
    // try {
    //   // set state to loading
    //   state = const AsyncValue.loading();
    //   // sign out (using auth repo)
    //   await authRepository.signOut();
    //   // if success, set state to data
    //   state = const AsyncValue.data(null);
    //   return true;
    // } catch (e, st) {
    //   // if error, set state to error
    //   state = AsyncValue.error(e, st);
    //   return false;
    // }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.signOut());
    return state.hasError == false;
  }
}

final accountScreenControllerProvider =
    StateNotifierProvider.autoDispose<AccountScreenController, AsyncValue>(
        (ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository);
});
