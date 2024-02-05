import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class RegionItem extends StatelessWidget {
  late String name;
  late int index;
  late int currentIdx;
  late bool active;
  late Function(int idx) handlePress;
  RegionItem(
      {super.key,
      required this.name,
      required this.index,
      required this.currentIdx,
      required this.handlePress});

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
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            side: MaterialStateProperty.all(
                BorderSide(color: active ? Colors.black : Colors.black26))),
        child: Text(
          this.name.capitalize!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: active ? FontWeight.w500 : FontWeight.w300),
        ),
      ),
    );
  }
}
