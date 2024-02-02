import 'package:app/widgets/ui/button.widget.dart';
import 'package:app/widgets/ui/inpu.widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  bool loading = false;
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  void handleRegistration() {
    print(_email.text);
    print(_password.text);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            Text("Register",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            SizedBox(height: 60),
            InputWidget(
              controller: _username,
              hintText: "Enter your username",
              icon: Icons.person,
            ),
            SizedBox(height: 25),
            InputWidget(
              controller: _email,
              hintText: "Enter your email",
              icon: Icons.email,
            ),
            SizedBox(height: 25),
            InputWidget(
                controller: _password,
                hintText: "Enter your password",
                icon: Icons.lock,
                obscure: true),
            SizedBox(height: 25),
            InputWidget(
                controller: _password2,
                hintText: "Confirm your password",
                icon: Icons.lock,
                obscure: true),
            SizedBox(height: 33),
            ButtonWidget(
                text: "register",
                onPress: () {
                  handleRegistration();
                  Navigator.pop(ctx);
                  Navigator.pushNamed(ctx, "/home");
                },
                loading: loading)
          ],
        ),
      )),
    );
  }
}
