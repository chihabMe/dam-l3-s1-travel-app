import 'dart:ui';

import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  late Function() handleClick;
  late bool active;

  LikeButton({required this.active, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 5, sigmaY: 5), // Adjust the sigma values as needed
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            child: IconButton(
              onPressed: () {
                print("clicked");
                this.handleClick();
              },
              color: this.active ? Colors.red : Colors.white,
              focusColor: Colors.red,
              icon: Icon(this.active ? Icons.favorite : Icons.favorite_border,
                  size: 30),
            ),
          ),
        ),
      ),
    );
  }
}
