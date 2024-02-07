import 'package:flutter/material.dart';
import 'package:app/widgets/categoriesList/categories.filters.list.dart';
import 'package:app/widgets/categoriesList/categories.list.dart';
import 'package:app/widgets/placesList/places.list.dart';
import 'package:app/widgets/regionsList/regions.list.dart';
import 'package:app/widgets/ui/home.title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
  elevation: 0,
  backgroundColor: Colors.blue.shade50,
  title: Padding(
    padding: const EdgeInsets.only(top: 8,left: 12),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.account_circle,
            size: 40,
            color: Colors.black,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "Massi the Dog",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTitle(
                  text: "Regions",
                  size: 24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 15),
                RegionsList(),
                SizedBox(height: 20),
                PlacesList(),
                SizedBox(height: 30),
                HomeTitle(
                  text: "Categories",
                  size: 24,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 15),
                CategoriesFiltersList(),
                SizedBox(height: 15),
                CategoiresList(),
              ],
            ),
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/search");
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
