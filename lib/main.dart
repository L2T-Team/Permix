import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:permix/screen/login-screen.dart';
import 'package:permix/screen/splash-screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static const BUTTON_WIDTH_RATIO = 0.38;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      title: "Permix",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        actionIconTheme: const ActionIconThemeData(),
        badgeTheme: BadgeThemeData(),
        fontFamily: "Lato",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size.fromWidth(BUTTON_WIDTH_RATIO * size.width),
            ),
            shape: MaterialStateProperty.all(
              LinearBorder(side: BorderSide.none),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size.fromWidth(BUTTON_WIDTH_RATIO * size.width),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: Color.fromRGBO(220, 207, 102, 1),
                  // Theme.of(context).colorScheme.primary,
                  //this cause error
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        colorScheme: const ColorScheme(
            primary: Color.fromRGBO(220, 207, 102, 1),
            onPrimary: Colors.black,
            secondary: Color.fromRGBO(127, 105, 81, 1),
            onSecondary: Colors.black,
            background: Color.fromRGBO(50, 50, 50, 1), //#323232
            brightness: Brightness.light,
            error: Colors.red,
            onError: Colors.red,
            onBackground: Colors.green,
            surface: Colors.orange,
            onSurface: Colors.black12),
      ),
      home: Scaffold(body: LoginScreen()),
    );
  }
}
