import 'package:flutter/material.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .colorScheme
          .primary,
      width: 100,
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        status,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black,
            height: 1),
      ),
    );
  }
}
