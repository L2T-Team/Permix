import 'package:flutter/material.dart';

void showFeatureSoonSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        child: Text('Feature is coming soon!'),
      ),
    ),
  );
}
