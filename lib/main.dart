import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:permix/screen/login-screen.dart';
import 'package:permix/screen/product-detail-screen.dart';
import 'package:permix/screen/product-screen.dart';
import 'package:permix/screen/signup-screen.dart';
import 'package:permix/screen/splash-screen.dart';
import 'package:permix/util/constant.dart';

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
        colorScheme: const ColorScheme(
            primary: PRIMARY_COLOR,
            onPrimary: Colors.black,
            secondary: SECONDARY_COLOR,
            onSecondary: Colors.black,
            background: BACKGROUND_COLOR,
            //#323232
            brightness: Brightness.light,
            error: Colors.red,
            onError: Colors.red,
            onBackground: Colors.green,
            surface: Colors.orange,
            onSurface: Colors.black12),
        actionIconTheme: const ActionIconThemeData(),
        appBarTheme: AppBarTheme(
          color: SECONDARY_COLOR,
          elevation: 0,
        ),
        fontFamily: "Lato",
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
          bodySmall: TextStyle(
              color: PRIMARY_COLOR, fontWeight: FontWeight.w300, fontSize: 16,
          height: 1.5),
          bodyMedium: TextStyle(
              color: PRIMARY_COLOR, fontWeight: FontWeight.w400, fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size.fromWidth(BUTTON_WIDTH_RATIO * size.width),
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 5, bottom: 5),
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
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 10, bottom: 10),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                side: BorderSide(
                  color: PRIMARY_COLOR,
                  // Theme.of(context).colorScheme.primary,
                  //this cause error
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
      home:  ProductDetailScreen(),
      /*onGenerateRoute: (settings) {
        //TODO: find better way
        switch (settings.name) {
          case SplashScreen.routeName:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => SplashScreen(),
              transitionDuration: Duration(seconds: 2),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            );
          case LoginScreen.routeName:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginScreen(),
              transitionDuration: Duration(seconds: 2),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            );
          case SignupScreen.routeName:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => SplashScreen(),
              transitionDuration: Duration(seconds: 2),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            );
        }
      },*/
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        ProductScreen.routeName: (ctx) => ProductScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
      },
    );
  }
}
