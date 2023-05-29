import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/cart-item.dart';
import 'package:permix/widget/common/custom-text-form-field.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: size.width,
        height: size.height - kToolbarHeight - padding.top,
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.symmetric(
            vertical: 30, horizontal: DEFAULT_HORIZONTAL_PADDING),
        child: Column(
          children: [
            Text(
              'MY CART',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2 Items',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text('Select All'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Divider(
                thickness: 1,
                height: 6,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: size.height / 2.5,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return CartItem();
                  }),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('$IMAGE_PATH/truck-icon.png'),
                  color: PRIMARY_COLOR,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Free Shipping applied over 4.000k!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(height: 1),
                )
              ],
            ),
            Expanded(
              child: Column(
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Payment Details'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Purchase'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
