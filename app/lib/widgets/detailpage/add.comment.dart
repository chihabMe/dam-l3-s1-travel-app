import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddCommentState();
}

class AddCommentState extends State<AddComment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(children: [
              TextField(
                cursorHeight: 30,
                decoration: InputDecoration(
                  hintText: "thoughts about the place",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  left: 320,
                ),
                child: IconButton(
                  onPressed: () {
                    //send the comment
                  },
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  iconSize: 27,
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
