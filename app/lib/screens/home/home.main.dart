import 'package:app/screens/home/favorite.screen.dart';
import 'package:app/screens/home/home.screen.dart';
import 'package:app/screens/home/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}
class _HomePageViewState extends State<HomePageView> {
  int selectedIndex = 0;

  void onTabNav(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    HomeScreen(),
    FavScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GNav(
          color: const Color.fromARGB(255, 57, 57, 57),
          activeColor: Colors.lightBlue, // Make sure MainColor is properly defined
          gap: 8,
          duration: const Duration(milliseconds: 500),
          onTabChange: onTabNav,
          padding: EdgeInsets.all(16),
          tabBackgroundColor: Color.fromARGB(69, 144, 202, 249),
          tabs: [
            GButton(
              icon: Icons.home_rounded,
              text: "Home",
            ),
            GButton(icon: Icons.favorite, text: "Favorite"),
            GButton(icon: Icons.person_sharp, text: "Profile"),],
        ),
      ),
    );
  }
}