import 'package:app/interfaces/i.comment.dart';
import 'package:app/interfaces/i.place.dart';
import 'package:app/screens/place.detail.screen.dart';
import 'package:app/widgets/ui/home.title.dart';
import 'package:app/widgets/ui/like.button.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {
  final IComment comment;
  late double width;
  late double height;
  CommentItem({required this.comment, this.width = 280, this.height = 100});

  @override
  State<StatefulWidget> createState() => CommentItemState(
      comment: this.comment, height: this.height, width: this.width);
}

class CommentItemState extends State<CommentItem> {
  late double width;
  late double height;
  final IComment comment;
  CommentItemState(
      {required this.comment, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    late IComment comment;
    return GestureDetector(
      child: Container(
        width: this.width,
        height: this.height,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SizedBox()),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(191, 110, 177, 235),
                      border:
                          Border.all(color: Color.fromARGB(135, 33, 149, 243)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Text(
                    this.comment.username,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                  right: 200,
                  bottom: 10,
                  child: Text(
                    this.comment.comment,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
