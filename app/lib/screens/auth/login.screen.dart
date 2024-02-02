import 'package:app/widgets/ui/button.widget.dart';
import 'package:app/widgets/ui/inpu.widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  void handleLogin() {
    print(_email.text);
    print(_password.text);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Text("Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            SizedBox(height: 60),
            InputWidget(
              controller: _email,
              hintText: "Enter your email",
              icon: Icons.email,
            ),
            SizedBox(height: 13),
            InputWidget(
                controller: _password,
                hintText: "Enter your password",
                icon: Icons.lock,
                obscure: true),
            SizedBox(height: 33),
            ButtonWidget(
                text: "login",
                onPress: () {
                  handleLogin();
                  Navigator.pop(ctx);
                  Navigator.pushNamed(ctx, "/register");
                },
                loading: loading)
          ],
        ),
      )),
    );
  }
}
