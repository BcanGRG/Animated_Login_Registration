import 'package:animated_login_and_registration/auth_screen.dart';
import 'package:animated_login_and_registration/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Login',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white38,
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.symmetric(
                  vertical: AppConstants.defaultPadding * 1.2,
                  horizontal: AppConstants.defaultPadding))),
      home: AuthScreen(),
    );
  }
}
