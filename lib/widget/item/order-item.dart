import 'package:flutter/material.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/util/helper.dart';
import 'package:permix/widget/item/list-item.dart';
import 'package:permix/widget/order-status-badge.dart';

import '../../model/order.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(this.order, {Key? key}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return ListItem(
      height: 90,
      leading: const Icon(Icons.list_alt),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OrderStatusBadge(status: order.orderStatus.toString()),
        ],
      ),
      title: getFormatterDateTime(order.dateTime),
      subTitle: '${order.totalPrice.toStringAsFixed(0)}k',
    );
  }
}
