import 'package:flutter/material.dart';
import 'package:permix/screen/cart-screen.dart';
import 'package:permix/screen/menu-screen.dart';

import '../../util/constant.dart';
import '../../util/custom-page-route-builder.dart';

AppBar getAppBar(BuildContext context,
        {bool isMenuActive = true, bool isCartActive = true}) =>
    AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: IconButton(
          padding: EdgeInsets.zero,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          icon: ImageIcon(
            AssetImage('assets/images/menu-icon.png'),
            color: PRIMARY_COLOR,
          ),
          onPressed: isMenuActive
              ? () {
                  Navigator.of(context).push(
                      CustomPageRouteBuilder.getPageRouteBuilder(MenuScreen()));
                }
              : () {},
        ),
      ),
      title: Center(child: Image.asset('assets/images/logo-sub.png')),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/cart-icon.png'),
              color: PRIMARY_COLOR,
            ),
            onPressed: isCartActive
                ? () {
                    Navigator.of(context).push(
                        CustomPageRouteBuilder.getPageRouteBuilder(
                            CartScreen()));
                  }
                : () {},
          ),
        ),
      ],
    );
