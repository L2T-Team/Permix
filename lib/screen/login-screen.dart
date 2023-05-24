import 'package:flutter/material.dart';
import 'package:permix/widget/login-form.dart';

import '../util/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          alignment: Alignment.topLeft,
          color: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                width: double.infinity,
                child: Text(
                  'WELCOME \nBACK.',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  'Sign in with',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Google',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, bottom: 35),
                child: Divider(
                  thickness: 1,
                  height: 6,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                'Log in with Username',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
