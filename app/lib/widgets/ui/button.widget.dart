import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ButtonWidget extends StatelessWidget {
  late String text;
  late Function()? onPress;
  late bool loading;
  ButtonWidget({required this.text, this.onPress, this.loading = false}) {}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: this.onPress,
        child: Text(this.text,
            style: TextStyle(color: Colors.white, fontSize: 16)),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(1),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.blue)),
      ),
    );
  }
}
