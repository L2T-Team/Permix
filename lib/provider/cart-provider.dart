import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:permix/model/cart-product.dart';
import 'package:permix/model/enum.dart';
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

  Future<void> submitOrder(String orderName, String userId, String userEmail) async {
    await FirebaseFirestore.instance.collection('orders').add(<String, dynamic>{
      'name': orderName,
      'userId': userId,
      'userEmail': userEmail,
      'totalPrice': getTotalSelectedPrice(),
      'dateTime': DateTime.now(),
      'orderStatus': OrderStatus(OrderStatusValues.paid).toString(),
    });

    var newState = Map<String, CartProduct>.from(state);
    newState.removeWhere((key, value) => value.isSelected);

    state = newState;
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

  int countSelected() {
    return state.values.fold(
        0,
        (previousValue, element) =>
            previousValue += element.isSelected ? 1 : 0);
  }

  double getTotalSelectedPrice() {
    return state.values.fold(
      0.0,
      (previousValue, element) => previousValue +=
          element.isSelected ? element.amount * element.indiePrice : 0.0,
    );
  }

  String getOrderName() {
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    return 'order_${formatter.format(DateTime.now())}';
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, Map<String, CartProduct>>(
  (ref) => CartNotifier({}),
);
