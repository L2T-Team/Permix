import 'package:flutter/material.dart';

import '../../util/constant.dart';

final AppBar appBar = AppBar(
  leading: Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: ImageIcon(
      AssetImage('assets/images/menu-icon.png'),
      color: PRIMARY_COLOR,
    ),
  ),
  title: Center(child: Image.asset('assets/images/logo-sub.png')),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: ImageIcon(
        AssetImage('assets/images/cart-icon.png'),
        color: PRIMARY_COLOR,
      ),
    ),
  ],
);
