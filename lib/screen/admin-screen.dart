import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/item/admin-item.dart';

import '../widget/common/app-bar.dart';
import '../widget/item/order-item.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, isAdmin: true),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: DEFAULT_HORIZONTAL_PADDING,
        ),
        width: double.infinity,
        child:  Column(
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
                      child: AdminItem(),
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
