import 'package:permix/model/enum.dart';
import 'package:permix/model/product.dart';

class Order {
  final String id;
  final String name;
  final String userId;
  final String userEmail;
  final double totalPrice;
  final DateTime dateTime;
  final String productIds;
  OrderStatus orderStatus;

  Order({
    required this.id,
    required this.name,
    required this.userId,
    required this.userEmail,
    required this.totalPrice,
    required this.dateTime,
    required this.productIds,
    this.orderStatus = const OrderStatus(OrderStatusValues.paid),
  });

  static Order fromMap(Map<String, dynamic> data, String id) {
    return Order(
        id: id,
        name: data['name'],
        userId: data['userId'],
        userEmail: data['userEmail'],
        totalPrice: data['totalPrice'],
        dateTime: data['dateTime'].toDate(),
        orderStatus: OrderStatus.toOrderStatus(data['orderStatus']),
        productIds: data['productIds']);
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': order.id,
      'name': name,
      'userId': userId,
      'userEmail': userEmail,
      'totalPrice': totalPrice,
      'dateTime': dateTime,
      'orderStatus': orderStatus.toString(),
      'productIds': productIds,
    };
  }
}
