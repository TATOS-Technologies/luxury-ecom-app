import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta_package/api/api_repository/cart_get_data_repository.dart';
import 'package:meta_package/api/models/cart/cart_model.dart';
import 'package:mockito/mockito.dart';

class MockCartGetDataAPIRepository extends Mock
    implements CartGetDataAPIRepository {
  List<CartModel> cartGetDataProvider() {
    return cart;
  }

  List<CartModel> addToCartDataProvider(CartModel data) {
    cart.add(data);
    return cart;
  }
}

CartModel cartModel = CartModel(
  id: 78,
  customer: Customer(firstname: 'abc'),
);
List<CartModel> cart = [];

void main() {
  group('CartScreen', () {
    test('add to cart', () {
      MockCartGetDataAPIRepository mockCartGetDataAPIRepository =
          MockCartGetDataAPIRepository();

      List<CartModel> data =
          mockCartGetDataAPIRepository.addToCartDataProvider(cartModel);

      expect(data.length, 1);
    });

    test('add to cart', () {
      MockCartGetDataAPIRepository mockCartGetDataAPIRepository =
          MockCartGetDataAPIRepository();

      List<CartModel> data =
          mockCartGetDataAPIRepository.addToCartDataProvider(cartModel);

      expect(data.length, cart.length);
    });
    test('get list of cart', () {
      MockCartGetDataAPIRepository mockCartGetDataAPIRepository =
          MockCartGetDataAPIRepository();

      List<CartModel> data = mockCartGetDataAPIRepository.cartGetDataProvider();

      expect(data.length, cart.length);
      for (var element in data) {
        debugPrint("id : ${element.id}");
      }
    });
  });
}
