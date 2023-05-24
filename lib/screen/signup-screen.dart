import 'package:flutter/material.dart';
import 'package:permix/util/constant.dart';

import '../widget/signup-form.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          alignment: Alignment.topLeft,
          color: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.symmetric(horizontal: DEFAULT_HORIZONTAL_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                width: double.infinity,
                child: Text(
                  'CREATE \nACCOUNT.',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SignupForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
