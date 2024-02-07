import 'package:app/widgets/BottomNavigator.dart';
import 'package:app/widgets/categoriesList/categories.list.dart';
import 'package:app/widgets/favoritePlacesList/fav.places.list.dart';
import 'package:app/widgets/placesList/places.list.dart';
import 'package:app/widgets/regionsList/regions.list.dart';
import 'package:app/widgets/ui/home.title.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HomeTitle(text: "Favorite", size: 24, fontWeight: FontWeight.w600),
            SizedBox(height: 7),
            FavoritePlacesList(),
          ]),
        ),
      ),
      bottomNavigationBar: HomeBar(),
    );
  }
}
