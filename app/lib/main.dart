import 'package:app/screens/auth/login.screen.dart';
import 'package:app/screens/home/home.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      title: "myapp",
      home: HomeScreen(),
      initialRoute: "/",
      routes: {},
    );
  }
}
