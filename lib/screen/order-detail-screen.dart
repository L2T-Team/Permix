import 'package:flutter/material.dart';
import 'package:permix/util/helper.dart';
import 'package:permix/widget/common/my-back-button.dart';
import 'package:permix/widget/item/order-detail-item.dart';

import '../model/order.dart';
import '../util/constant.dart';
import '../widget/admin-order-dialog.dart';
import '../widget/common/app-bar.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen(this.order, {Key? key}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: getAppBar(context, isCartActive: false, isAdmin: true),
      body: Container(
        width: size.width,
        height: size.height - kToolbarHeight - padding.top,
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.symmetric(
            vertical: 30, horizontal: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          children: [
            Text(
              order.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '0 Item',
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
            const Expanded(
              child: Center(
                child: Text('List Products is coming soon!'),
              ),
            ),
            /*Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return OrderDetailItem();
                  }),
            ),*/
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
                      '${getThousandSeparatedString(order.totalPrice)}k',
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyBackButton(),
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AdminOrderDialog(order),
                          );
                        },
                        child: Text('Change Status')),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
