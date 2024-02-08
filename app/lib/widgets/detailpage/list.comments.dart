import 'package:app/widgets/detailpage/comment.item.dart';
import 'package:flutter/material.dart';
import 'package:app/interfaces/i.comment.dart';

class CommentsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CommentsListState();
}

class CommentsListState extends State<CommentsList> {
  @override
  Widget build(BuildContext context) {
    final List<IComment> comments = [
      IComment(username: "see4th", comment: "hhhhhhh biskra"),
      IComment(username: "chihab", comment: "aaaaaaaa"),
      IComment(username: "massi", comment: "ya kafir")
    ];
    return Container(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return BuildComment(comments[index]);
        },
      ),
    );
  }

  Widget BuildComment(IComment comment) {
    return CommentItem(comment: comment);
  }
}
