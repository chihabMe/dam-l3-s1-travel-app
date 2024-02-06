import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            TextField(
              controller: _controller,
            ),
            TextButton(onPressed: () {}, child: Text("search"))
          ],
        ));
  }
}
