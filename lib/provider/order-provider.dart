import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/cart-product.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/util/helper.dart';

import '../model/order.dart' as permix_order;

class OrderNotifier extends StateNotifier<List<permix_order.Order>> {
  OrderNotifier(List<permix_order.Order> initialOrders) : super(initialOrders);

  Future<void> getAllOrderByUserId(String userId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .orderBy('dateTime', descending: true)
        .where('userId', isEqualTo: userId)
        .get();
    List<permix_order.Order> newOrders = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      newOrders.add(
        permix_order.Order.fromMap(data, doc.id),
      );
    }
    await attachProducts(newOrders);
    state = newOrders;
  }

  Future<void> attachProducts(List<permix_order.Order> orders) async {
    for (var order in orders) {
      var idList = parseListString(order.productIds);
      var qtyList = parseListString(order.quantityStrings);
      var nameList = parseListString(order.productNames);
      var priceList = parseListString(order.productPrices);
      var imgUrlList = parseListString(order.productImgUrls);
      var newProdList = <CartProduct>[];
      for (int i = 0; i < idList.length; i++) {
        newProdList.add(
          CartProduct(
            productId: idList[i],
            name: nameList[i],
            indiePrice: double.parse(priceList[i]),
            imgUrl: imgUrlList[i],
            amount: int.parse(qtyList[i]),
          ),
        );
      }
      order.products = newProdList;
    }
  }

  Future<void> updateOrderStatus(String id, permix_order.Order order) async {
    var collection = FirebaseFirestore.instance.collection('orders');
    await collection.doc(id).update(order.toMap());

    var newState = [...state];
    newState.where((element) => element.id == order.id);
    state = newState;
  }

  Future<void> getAllOrders() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .orderBy('dateTime', descending: true)
        .get();
    List<permix_order.Order> newOrders = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      newOrders.add(
        permix_order.Order.fromMap(data, doc.id),
      );
    }
    await attachProducts(newOrders);
    state = newOrders;
  }

  int getLength() {
    return state.length;
  }
}

final orderProvider =
    StateNotifierProvider<OrderNotifier, List<permix_order.Order>>(
  (ref) => OrderNotifier([]),
);
