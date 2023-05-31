import 'package:flutter/material.dart';
import 'package:permix/screen/payment-screen.dart';
import 'package:permix/screen/shipping-screen.dart';
import 'package:permix/widget/common/order-detail-item.dart';

import '../util/constant.dart';
import '../util/custom-page-route-builder.dart';
import '../widget/common/app-bar.dart';
import '../widget/common/cart-item.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: getAppBar(context, isCartActive: false),
      body: Container(
        width: size.width,
        height: size.height - kToolbarHeight - padding.top,
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.symmetric(
            vertical: 30, horizontal: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          children: [
            Text(
              'ORDER DETAIL',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '2 Items',
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
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return OrderDetailItem();
                  }),
            ),
            SizedBox(height: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount'),
                    Text(
                      '5.000k',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  height: 6,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        CustomPageRouteBuilder.getPageRouteBuilder(
                            ShippingScreen()));
                  },
                  child: Text('Back'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
