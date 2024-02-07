import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget {
  @override
  HomeBarState createState() => HomeBarState();
}

class HomeBarState extends State<HomeBar> {
  late int _selectedIndex = 0;

  void handleTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 28,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      elevation: 30,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "faveroties"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
      ],
      onTap: handleTap,
    );
  }
}
