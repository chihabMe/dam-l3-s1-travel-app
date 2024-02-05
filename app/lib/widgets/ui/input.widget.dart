import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  late String hintText;
  late TextEditingController controller;
  late bool obscure;
  late IconData icon;
  InputWidget(
      {required TextEditingController controller,
      required String hintText,
      bool obscure = false,
      required IconData icon}) {
    this.hintText = hintText;
    this.controller = controller;
    this.obscure = obscure;
    this.icon = icon;
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        obscureText: this.obscure,
        decoration: InputDecoration(
          hintText: this.hintText,
          icon: Icon(this.icon, color: Colors.blue),
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ));
  }
}
