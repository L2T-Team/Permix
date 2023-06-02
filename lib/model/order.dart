import 'package:permix/model/enum.dart';

class Order {
  final String name;
  final String userId;
  final double totalPrice;
  final DateTime dateTime;
  final OrderStatus orderStatus;

  Order({
    required this.name,
    required this.userId,
    required this.totalPrice,
    required this.dateTime,
    required this.orderStatus,
  });
}
