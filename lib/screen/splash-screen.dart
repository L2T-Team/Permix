import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.background,
      child: Image.asset("assets/images/logo-main.png"),
    );
  }
}