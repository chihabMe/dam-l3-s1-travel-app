import 'package:app/screens/welcome_screens/welcome.screen1.dart';
import 'package:app/screens/welcome_screens/welcome.screen2.dart';
import 'package:app/screens/welcome_screens/welcome.screen3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                WelcomeScreen1(),
                WelcomeScreen2(),
                WelcomeScreen3(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 3, effect: const WormEffect(
                activeDotColor: Colors.blue, // Set the active dot color
                ),),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ), // Adjust vertical padding
              child: ElevatedButton(
                onPressed: () {
                  if (!onLastPage) {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/home");
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 8.0,
                  ),
                ),
                child: Text(
                  onLastPage ? "Finish" : "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
