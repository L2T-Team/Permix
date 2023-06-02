import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permix/screen/customize-screen.dart';
import 'package:permix/screen/login-screen.dart';
import 'package:permix/util/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainApp()));
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
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
        fontFamily: "Lato",
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
          bodySmall: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w300,
              fontSize: 16,
              height: 1.5),
          bodyMedium: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.5,
          ),
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
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w300,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
