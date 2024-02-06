import 'package:flutter/material.dart';
import 'package:app/widgets/BottomNavigator.dart';
import 'package:app/widgets/categoriesList/categories.filters.list.dart';
import 'package:app/widgets/categoriesList/categories.list.dart';
import 'package:app/widgets/placesList/places.list.dart';
import 'package:app/widgets/regionsList/regions.list.dart';
import 'package:app/widgets/search_filter/search.dart';
import 'package:app/widgets/ui/home.title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 57,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 243, 243),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 20,
                            color: Color.fromARGB(255, 166, 166, 166),
                          )),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Explore  new places",
                            hintStyle: TextStyle(fontSize: 14)),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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
