import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/provider/auth-provider.dart';
import 'package:permix/provider/cart-provider.dart';
import 'package:permix/screen/home-screen.dart';
import 'package:permix/screen/order-screen.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/util/helper.dart';
import 'package:permix/widget/admin-order-dialog.dart';
import 'package:permix/widget/common/app-bar.dart';

import '../util/custom-page-route-builder.dart';
import '../widget/common/info-row.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  final _phoneNum = '0327 334 385';
  final _name = 'TRAN DINH MINH NHAN';
  final _bankName = 'TP Bank';
  final _bankNum = '03594892501';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderName = ref.read(cartProvider.notifier).getOrderName();

    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: DEFAULT_HORIZONTAL_PADDING,
        ),
        color: Theme.of(context).colorScheme.background,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'PAYMENT INFO',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount'),
                Text(
                  getThousandSeparatedString(
                      ref.watch(cartProvider.notifier).getTotalSelectedPrice()),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Bank',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            InfoRow(Icons.money, _bankName),
            InfoRow(Icons.numbers, _bankNum),
            InfoRow(Icons.person, _name),
            InfoRow(Icons.description, orderName),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                thickness: 1,
                height: 6,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text(
              'Momo',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            InfoRow(Icons.numbers, _phoneNum),
            InfoRow(Icons.person, _name),
            InfoRow(Icons.description, orderName),
            Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: PRIMARY_COLOR,
                splashColor: PRIMARY_COLOR,
                child: InfoRow(Icons.qr_code, 'QR Code'),
                onTap: () async {
                  await showDialog(
                      context: context, builder: (_) => ImageDialog());
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Back')),
                    ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Your order is submitted!'),
                            ),
                          );
                          ref
                              .read(cartProvider.notifier)
                              .submitOrder(
                                orderName,
                                ref.read(authProvider)!.user.id,
                                ref.read(authProvider)!.user.email!,
                                ref
                                    .read(cartProvider.notifier)
                                    .getAllSelectedProducts(),
                              )
                              .then((value) {
                            Navigator.of(context).pushAndRemoveUntil(
                                CustomPageRouteBuilder.getPageRouteBuilder(
                                    ProductScreen()),
                                (route) => false);
                          });
                        },
                        child: const Text('Transferred'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      child: Container(
        width: size.width - 40,
        padding: EdgeInsets.all(10),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('$IMAGE_PATH/qr-code.jpg'),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            )
          ],
        ),
      ),
    );
  }
}
