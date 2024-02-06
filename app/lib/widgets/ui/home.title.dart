import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  late String text;
  late Color color;
  late double size;
  late FontWeight fontWeight;
  HomeTitle(
      {required this.text,
      this.color = Colors.black,
      this.size = 15,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        style: TextStyle(
            color: this.color,
            fontSize: this.size,
            fontWeight: this.fontWeight));
  }
}
