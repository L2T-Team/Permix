import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/provider/auth-provider.dart';
import 'package:permix/screen/admin-screen.dart';
import 'package:permix/screen/customize-screen.dart';
import 'package:permix/screen/home-screen.dart';
import 'package:permix/screen/order-screen.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/screen/splash-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:permix/widget/common/app-bar.dart';
import 'package:permix/widget/common/my-back-button.dart';

import '../provider/customize-provider.dart';
import '../util/custom-page-route-builder.dart';
import '../widget/common/custom-snack-bar.dart';

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
      appBar: getAppBar(
        context,
        isAdmin: isAdmin,
        isMenuActive: false,
        isCartActive: false,
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Consumer(
          builder: (context, ref, _) {
            var user = ref.watch(authProvider)!.user;
            var userName = user.name;
            var userEmail = user.email;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: isAdmin
                  ? [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                CustomPageRouteBuilder.getPageRouteBuilder(
                                  AdminScreen(),
                                ),
                              );
                            },
                            child: Text('All Order'),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                CustomPageRouteBuilder.getPageRouteBuilder(
                                  const HomeScreen(),
                                ),
                                (route) => false);
                          },
                          child: Text('Log out'),
                        ),
                      ),
                      Expanded(
                        child: isAdmin
                            ? SizedBox.shrink()
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Back')),
                                ),
                              ),
                      ),
                    ]
                  : [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: ImageIcon(
                          const AssetImage(
                            '$IMAGE_PATH/profile-icon.png',
                          ),
                          size: size.width / 6,
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      Text(
                        userName ?? userEmail!,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        userEmail!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
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
                      Consumer(builder: (context, ref, _) {
                        return ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(customizeProvider.notifier)
                                  .resetIfCreated();
                              Navigator.of(context).pushReplacement(
                                  CustomPageRouteBuilder.getPageRouteBuilder(
                                      CustomizeScreen()));
                            },
                            child: Text('Customize'));
                      }),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                CustomPageRouteBuilder.getPageRouteBuilder(
                                    OrderScreen()));
                          },
                          child: Text('My Orders')),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            showFeatureSoonSnackBar(context);
                          },
                          child: Text('Settings')),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              CustomPageRouteBuilder.getPageRouteBuilder(
                                const HomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text('Log out')),
                      const Expanded(
                        child: Align(
                          child: MyBackButton(),
                        ),
                      ),
                    ],
            );
          },
        ),
      ),
    );
  }
}
