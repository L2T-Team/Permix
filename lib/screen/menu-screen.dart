import 'package:flutter/material.dart';
import 'package:permix/screen/customize-screen.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';

import '../util/custom-page-route-builder.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
    this.isAdmin = false,
  }) : super(key: key);
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(context, isMenuActive: false),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: isAdmin
              ? [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Log out'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Back')),
                    ),
                  ),
                ]
              : [
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
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            CustomPageRouteBuilder.getPageRouteBuilder(
                                ProductScreen()));
                      },
                      child: Text('All Products')),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                            CustomPageRouteBuilder.getPageRouteBuilder(
                                CustomizeScreen()));
                      },
                      child: Text('Customize')),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: () {}, child: Text('My Orders')),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: () {}, child: Text('Settings')),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: () {}, child: Text('Log out')),
                  Expanded(
                    child: Align(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Back')),
                    ),
                  ),
                ],
        ),
      ),
    );
  }
}
