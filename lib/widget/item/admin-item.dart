import 'package:flutter/material.dart';
import 'package:permix/util/helper.dart';

import '../../model/enum.dart';
import '../../model/order.dart';
import 'list-item.dart';
import '../order-status-badge.dart';

class AdminItem extends StatelessWidget {
  const AdminItem(this.order, {Key? key}) : super(key: key);

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
          OrderStatusBadge(
            status: order.orderStatus.toString(),
          ),
        ],
      ),
      title: getFormatterDateTime(order.dateTime),
      subTitle: getThousandSeparatedString(order.totalPrice),
    );
  }
}
