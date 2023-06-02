import 'package:flutter/material.dart';

import '../../model/enum.dart';
import 'list-item.dart';
import '../order-status-badge.dart';

class AdminItem extends StatelessWidget {
  const AdminItem({Key? key}) : super(key: key);

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
