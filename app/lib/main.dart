import 'package:app/screens/auth/login.screen.dart';
import 'package:app/screens/auth/register.screen.dart';
import 'package:app/screens/home/home.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: "myapp",
      home: LoginScreen(),
      initialRoute: "/",
      routes: {
        "/home": (ctx) => HomeScreen(),
        "/register": (ctx) => RegisterScreen()
      },
    );
  }
}
