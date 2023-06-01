import 'package:permix/model/cart-product.dart';
import 'package:permix/model/product.dart';
import 'package:riverpod/riverpod.dart';

class CartNotifier extends StateNotifier<Map<String, CartProduct>> {
  CartNotifier(Map<String, CartProduct> initialProds) : super(initialProds);

  bool addToCart(Product prod) {
    var isAdded = true;
    final cartProd = CartProduct(
      productId: prod.id,
      name: prod.name,
      indiePrice: prod.price,
      imgUrl: prod.imgUrl,
    );

    if (state.containsKey(prod.id)) {
      var newAmount = state[prod.id]!.amount++;
      cartProd.isSelected = state[prod.id]!.isSelected;
      cartProd.amount = newAmount;
      isAdded = false;
    }
    state = {...state, prod.id: cartProd};
    return isAdded;
  }

  void toggleSelect(String prodId, bool val) {
    state.update(prodId, (value) {
      value.isSelected = val;
      return value;
    });
  }

  void selectAll() {
    for (var element in state.entries) {
      element.value.isSelected = true;
    }
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartProduct>>(
  (ref) => CartNotifier({}),
);
