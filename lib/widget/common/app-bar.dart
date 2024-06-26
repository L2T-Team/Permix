import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/screen/cart-screen.dart';
import 'package:permix/screen/menu-screen.dart';

import '../../provider/cart-provider.dart';
import '../../util/constant.dart';
import '../../util/custom-page-route-builder.dart';

AppBar getAppBar(
  BuildContext context, {
  bool isMenuActive = true,
  bool isCartActive = true,
  bool isAdmin = false,
}) =>
    AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: IconButton(
          padding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          icon: const ImageIcon(
            AssetImage('assets/images/menu-icon.png'),
            color: PRIMARY_COLOR,
          ),
          onPressed: isMenuActive
              ? () {
                  Navigator.of(context).push(
                    CustomPageRouteBuilder.getPageRouteBuilder(
                      MenuScreen(
                        isAdmin: isAdmin,
                      ),
                    ),
                  );
                }
              : () {},
        ),
      ),
      title: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo-sub.png'),
            isAdmin
                ? Text(
                    'Admin',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontFamily: 'Times New Roman'),
                  )
                : SizedBox(),
          ],
        ),
      ),
      actions: isAdmin
          ? [const Padding(padding: EdgeInsets.all(25))]
          : [
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  icon: Badge(
                    label: Consumer(
                      builder: (context, ref, _) {
                        var count = ref.watch(cartProvider).values.length;

                        return Text(count.toString());
                      },
                    ),
                    backgroundColor: BACKGROUND_COLOR,
                    textColor: PRIMARY_COLOR,
                    child: const ImageIcon(
                      AssetImage('assets/images/cart-icon.png'),
                      color: PRIMARY_COLOR,
                    ),
                  ),
                  onPressed: isCartActive
                      ? () {
                          Navigator.of(context).push(
                              CustomPageRouteBuilder.getPageRouteBuilder(
                                  const CartScreen()));
                        }
                      : () {},
                ),
              ),
            ],
    );
