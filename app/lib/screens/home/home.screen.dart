import 'package:app/widgets/BottomNavigator.dart';
import 'package:app/widgets/categoriesList/categories.list.dart';
import 'package:app/widgets/placesList/places.list.dart';
import 'package:app/widgets/regionsList/regions.list.dart';
import 'package:app/widgets/search_filter/search.dart';
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
                height: 14,
              ),
              CategoriesList(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigator(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPlace()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.search, color: Colors.white,),
      ),
    );
  }
}
