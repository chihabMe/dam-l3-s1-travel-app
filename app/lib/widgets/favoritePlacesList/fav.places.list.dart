import 'package:app/interfaces/i.place.dart';
import 'package:app/widgets/placesList/places.item.dart';
import 'package:flutter/material.dart';

class FavoritePlacesList extends StatefulWidget {
  const FavoritePlacesList({Key? key}) : super(key: key);

  @override
  FavoritePlacesListState createState() => FavoritePlacesListState();
}

class FavoritePlacesListState extends State<FavoritePlacesList> {
  List<IPlace> favorites = [
    IPlace(
      name: "Constantine",
      image: "assets/constantine-algeria.jpg",
      rating: 4.5,
      state: "Constantine",
    ),
    IPlace(
      name: "Algiers",
      image: "assets/Algiers-Cathedral.jpg",
      rating: 4.2,
      state: "Algiers",
    ),
    IPlace(
      name: "Biskra",
      image: "assets/Oran-Palms.jpg",
      rating: 4,
      state: "Biskra",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        primary: false,
        crossAxisSpacing: 0,
        mainAxisSpacing: 40,
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.5),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          buildCard(1),
          buildCard(2),
          buildCard(0),
          buildCard(0),
          buildCard(0),
          buildCard(0),
        ],
      ),
    );
  }

  Widget buildCard(int index) {
    return PlacesItem(
      place: favorites[index],
    );
  }
}
