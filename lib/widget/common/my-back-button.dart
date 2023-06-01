import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key, this.title = 'Back'}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(title),
    );
  }
}
