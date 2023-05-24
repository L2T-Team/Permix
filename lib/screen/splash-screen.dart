import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
          ElevatedButton(onPressed: () {}, child: Text('Login')),
          TextButton(onPressed: () {}, child: Text('Create Account')),
        ],
      ),
    );
  }
}
