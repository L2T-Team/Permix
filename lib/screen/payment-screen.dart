import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  Widget _buildInfoRow(BuildContext ctx, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(ctx).textTheme.bodyMedium!.copyWith(height: 1),
          ),
        ],
      ),
    );
  }

  final _phoneNum = '0327 334 385';
  final _name = 'TRAN DINH MINH NHAN';
  final _bankName = 'TP Bank';
  final _bankNum = '03594892501';

  @override
  Widget build(BuildContext context) {
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
                  '5.000k',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bank',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 10,
            ),
            _buildInfoRow(context, Icons.money, _bankName),
            _buildInfoRow(context, Icons.numbers, _bankNum),
            _buildInfoRow(context, Icons.person, _name),
            _buildInfoRow(context, Icons.description, 'order_1_20231201'),
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
            _buildInfoRow(context, Icons.numbers, _phoneNum),
            _buildInfoRow(context, Icons.person, _name),
            _buildInfoRow(context, Icons.description, 'order_1_20231201'),
            Material(
              color: Colors.transparent,
              child: InkWell(
                highlightColor: PRIMARY_COLOR,
                splashColor: PRIMARY_COLOR,
                child: _buildInfoRow(context, Icons.qr_code, 'Show QR Code'),
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
                    ElevatedButton(onPressed: () {}, child: Text('Transfered'))
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
