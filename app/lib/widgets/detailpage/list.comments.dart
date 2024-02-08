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
      IComment(username: "see4th", comment: "hhhhhhh biskra", rating: 3.1),
      IComment(username: "chihab", comment: "aaaaaaaa", rating: 3.1),
      IComment(username: "massi", comment: "ya kafir", rating: 3.1),
      IComment(username: "Zinos", comment: "Akhdmooo Yaw", rating: 4.8),
      IComment(username: "see4th", comment: "hhhhhhh biskra", rating: 3.1),
      IComment(username: "chihab", comment: "aaaaaaaa", rating: 3.1),
      IComment(username: "massi", comment: "ya kafir", rating: 3.1),
      IComment(username: "see4th", comment: "hhhhhhh biskra", rating: 3.1),
      IComment(username: "chihab", comment: "aaaaaaaa", rating: 3.1),
      IComment(username: "massi", comment: "ya kafir", rating: 3.1),
      IComment(username: "see4th", comment: "hhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskrahhhhhhh biskra", rating: 3.1),
      IComment(username: "chihab", comment: "aaaaaaaa", rating: 3.1),
      IComment(username: "massi", comment: "ya kafir", rating: 3.1),

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
