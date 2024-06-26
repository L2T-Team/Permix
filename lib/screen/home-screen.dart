import 'package:flutter/material.dart';
import 'package:permix/screen/login-screen.dart';
import 'package:permix/screen/signup-screen.dart';

import '../util/custom-page-route-builder.dart';
import '../util/routes.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/logo-main.png"),
          SizedBox(
            height: 1 / 6 * size.height,
          ),
          ElevatedButton(
              onPressed: () {
                /*Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LoginScreen(),
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );*/
                Navigator.of(context).push(
                    CustomPageRouteBuilder.getPageRouteBuilder(LoginScreen()));
              },
              child: Text('Login')),
          TextButton(
              onPressed: () {
                /*Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SignupScreen(),
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );*/
                Navigator.of(context).push(
                    CustomPageRouteBuilder.getPageRouteBuilder(SignupScreen()));
              },
              child: Text('Create Account')),
        ],
      ),
    );
  }
}
