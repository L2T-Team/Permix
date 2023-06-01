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
    var newCartProd = CartProduct.clone(state[prodId]!);
    newCartProd.isSelected = val;
    state = {...state, prodId: newCartProd};
  }

  void selectAll() {
    var newState = Map<String, CartProduct>.from(state);
    for (var element in newState.entries) {
      element.value.isSelected = true;
    }
    state = newState;
  }

  void increaseAmount(String prodId) {
    var newCartProd = CartProduct.clone(state[prodId]!);
    newCartProd.amount++;
    state = {...state, prodId: newCartProd};
  }

  void decreaseAmount(String prodId) {
    var newCartProd = CartProduct.clone(state[prodId]!);
    newCartProd.amount--;
    state = {...state, prodId: newCartProd};
  }

  void clearProduct(String prodId) {
    var newState = Map<String, CartProduct>.from(state);
    newState.remove(prodId);
    state = newState;
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartProduct>>(
  (ref) => CartNotifier({}),
);
