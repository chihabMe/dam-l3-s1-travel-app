import 'package:app/widgets/BottomNavigator.dart';
import 'package:app/widgets/categoriesList/categories.filters.list.dart';
import 'package:app/widgets/categoriesList/categories.list.dart';
import 'package:app/widgets/placesList/places.list.dart';
import 'package:app/widgets/regionsList/regions.list.dart';
import 'package:app/widgets/search/search.dart';
import 'package:app/widgets/ui/home.title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              // ignore: prefer_const_constructors
              HomeTitle(
                text: "Regions",
                size: 24,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 15,
              ),
              RegionsList(),
              SizedBox(
                height: 20,
              ),
              PlacesList(),
              SizedBox(
                height: 30,
              ),
              HomeTitle(
                text: "Categories",
                size: 24,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 15,
              ),
              CategoriesFiltersList(),
              SizedBox(
                height: 15,
              ),
              CategoiresList()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
