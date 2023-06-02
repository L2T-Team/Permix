import 'package:permix/model/enum.dart';

class Order {
  final String id;
  final String name;
  final String userId;
  final String userEmail;
  final double totalPrice;
  final DateTime dateTime;
  final OrderStatus orderStatus;

  Order({
    required this.id,
    required this.name,
    required this.userId,
    required this.userEmail,
    required this.totalPrice,
    required this.dateTime,
    required this.orderStatus,
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
    );
  }
}
