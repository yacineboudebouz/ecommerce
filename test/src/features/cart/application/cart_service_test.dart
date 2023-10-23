import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/cart/application/cart_service.dart';
import 'package:ecommerce_app/src/features/cart/data/local/local_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/data/remote/remote_cart_repository.dart';
import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/cart/domain/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late MockAuthRepository authRepository;
  late MockRemoteCartRepository remoteCartRepository;
  late MockLocalCartRepository localCartRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    remoteCartRepository = MockRemoteCartRepository();
    localCartRepository = MockLocalCartRepository();
  });
  CartService makeCartService() {
    final container = ProviderContainer(overrides: [
      authRepositoryProvider.overrideWithValue(authRepository),
      localCartRepositoryProvider.overrideWithValue(localCartRepository),
      remoteCartRepositoryProvider.overrideWithValue(remoteCartRepository),
    ]);
    addTearDown(container.dispose);
    return container.read(cartServiceProvider);
  }

  test('null user, writes item to local cart', () async {
    const expectedCart = Cart({'123': 1});
    when(() => authRepository.currentUser).thenReturn(null);
    when(() => localCartRepository.fetchCart()).thenAnswer(
      (invocation) => Future.value(const Cart()),
    );
    final cartService = makeCartService();
    await cartService.setItem(const Item(productId: '123', quantity: 1));

    verify(() => localCartRepository.setCart(expectedCart)).called(1);
  });
}
