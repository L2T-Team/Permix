import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/model/enum.dart';

import '../model/order.dart' as permix_order;

class OrderNotifier extends StateNotifier<List<permix_order.Order>> {
  OrderNotifier(List<permix_order.Order> initialOrders) : super(initialOrders);

  Future<void> getAllOrderByUserId(String userId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .get();
    List<permix_order.Order> newOrders = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      newOrders.add(
        permix_order.Order.fromMap(data, doc.id),
      );
    }
    state = newOrders;
  }

  Future<void> updateOrderStatus(String id, permix_order.Order order) async {
    var collection = FirebaseFirestore.instance.collection('orders');
    await collection.doc(id).update(order.toMap());
  }

  Future<void> getAllOrders() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('orders').get();
    List<permix_order.Order> newOrders = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      newOrders.add(
        permix_order.Order.fromMap(data, doc.id),
      );
    }

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
