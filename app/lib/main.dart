import 'package:app/screens/welcome_screens/welcome.screen.dart';
import 'package:app/screens/home/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Algeria Travel",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: OnBoardingScreen(),
      initialRoute: "/",
      routes: {"/home": (ctx) => HomeScreen()},
    );
  }
}
