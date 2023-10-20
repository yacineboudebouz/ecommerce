import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getPtroductsList returns global list', () {
    final productsRepo = FakeProductsRepository();
    expect(productsRepo.getProductsList(), kTestProducts);
  });
}
