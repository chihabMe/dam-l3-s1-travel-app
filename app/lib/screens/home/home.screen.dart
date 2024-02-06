import 'package:app/widgets/BottomNavigator.dart';
import 'package:app/widgets/placesList/places.list.dart';
import 'package:app/widgets/regionsList/regions.list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          RegionsList(),
          PlacesList(),
        ],
      ),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
