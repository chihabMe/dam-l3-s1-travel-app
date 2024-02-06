import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class FilterItem extends StatelessWidget {
  late String text;
  late int index;
  late int currentIdx;
  late Function(int idx) handlePress;
  late String iconPath;
  FilterItem(
      {super.key,
      required this.text,
      required this.index,
      required this.currentIdx,
      required this.handlePress,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    bool active = this.index == this.currentIdx;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: () {
          this.handlePress(this.index);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                active ? Colors.blue : Colors.transparent),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            side: MaterialStateProperty.all(BorderSide(color: Colors.black38))),
        child: Row(
          children: [
            Image(
              image: AssetImage(this.iconPath),
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              this.text.capitalize!,
              style: TextStyle(
                  color: active ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: active ? FontWeight.w500 : FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
