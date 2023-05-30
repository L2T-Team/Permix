import 'package:flutter/material.dart';

class CustomPageRouteBuilder {
  static getPageRouteBuilder(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        return page;
      },
    );
  }
}
