import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/order-item.dart';

import '../widget/common/app-bar.dart';
import '../widget/common/cart-item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        width: size.width,
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          children: [
            Text(
              'MY ORDERS',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '10 Orders',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                height: 6,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: OrderItem(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
