import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ImageIcon(
                AssetImage(
                  '$IMAGE_PATH/profile-icon.png',
                ),
                size: size.width / 6,
                color: PRIMARY_COLOR,
              ),
            ),
            Text(
              'PerfumeLover',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 10),
            Text(
              'perfumelover@permix.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: () {}, child: Text('All Products')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('Customize')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('My Orders')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('Settings')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: TextButton(onPressed: () {}, child: Text('Log out')),
            )
          ],
        ),
      ),
    );
  }
}
