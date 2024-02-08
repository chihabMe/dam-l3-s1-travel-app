import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddComment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddCommentState();
}

class AddCommentState extends State<AddComment> {
  TextEditingController _textEditingController = TextEditingController();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  cursorHeight: 30,
                  maxLines: null, // Allow dynamic expansion
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    hintText: "Thoughts about the place",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _showRatingDialog();
                },
                icon: Icon(Icons.send),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showRatingDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rate this place'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please select your rating'),
              SizedBox(height: 20),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 30,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle rating submission here
                print('Rating: $_rating');
                _textEditingController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
