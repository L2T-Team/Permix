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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
            _buildInfoRow(context, Icons.money, 'TP Bank'),
            _buildInfoRow(context, Icons.numbers, '01234 22324'),
            _buildInfoRow(context, Icons.person, 'NGUYEN HUYNH MINH KHOI'),
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
            _buildInfoRow(context, Icons.numbers, '01234 22324'),
            _buildInfoRow(context, Icons.person, 'NGUYEN HUYNH MINH KHOI'),
            _buildInfoRow(context, Icons.description, 'order_1_20231201'),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Back')),
                    ElevatedButton(onPressed: () {}, child: Text('Transered'))
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
