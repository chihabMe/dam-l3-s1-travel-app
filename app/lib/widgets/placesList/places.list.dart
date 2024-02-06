import 'package:app/interfaces/i.place.dart';
import 'package:app/widgets/placesList/places.item.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  PlacesListState createState() => PlacesListState();
}

class PlacesListState extends State<PlacesList> {
  List<IPlace> places = [
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
    return Container(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return buildCard(index);
        },
      ),
    );
  }

  Widget buildCard(int index) {
    return PlacesItem(place: places[index]);
  }
}
