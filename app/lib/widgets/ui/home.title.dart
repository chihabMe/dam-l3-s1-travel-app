import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  late String text;
  late Color color;
  late double size;
  HomeTitle({required this.text, this.color = Colors.blue, this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        style: TextStyle(
            color: this.color,
            fontSize: this.size,
            fontWeight: FontWeight.w500));
  }
}
