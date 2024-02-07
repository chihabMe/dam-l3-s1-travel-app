import 'package:app/interfaces/i.user.dart';
import 'package:app/widgets/ui/home.title.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  late IUser user;
  @override
  void initState() {
    // TODO: implement initState
    this.user = IUser(
        name: "seth",
        familyname: "benmeddour",
        email: "seth@gmail.com",
        image: "assets/welcome.jpg",
        username: "see4th");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: ListView(
          children: [
            //profile pic

            CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                  this.user.image,
                  
                )),

            SizedBox(
              height: 20,
            ),
            //user name
            Center(
                child: Text(
              this.user.username,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            )),
            SizedBox(
              height: 40,
            ),
            //user details
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HomeTitle(
                    text: "Details",
                    size: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 30),
                  //user email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(children: [
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                this.user.name + " " + this.user.familyname,
                                style: TextStyle(fontSize: 17),
                              ),
                            ]),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: double.infinity,
                            child: Row(children: [
                              Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                this.user.email,
                                style: TextStyle(fontSize: 17),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
