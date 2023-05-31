import 'package:flutter/material.dart';
import 'package:permix/model/enum.dart';
import 'package:permix/widget/item/list-item.dart';
import 'package:permix/widget/order-status-badge.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListItem(
      height: 90,
      leading: Icon(Icons.list_alt),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OrderStatusBadge(
              status: OrderStatus(OrderStatusValues.delivering).toString()),
          Text(
            'Verifying payment!',
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 13),
          ),
        ],
      ),
      title: '01/04/2013',
      subTitle: '2.999K',
    );
  }
}
