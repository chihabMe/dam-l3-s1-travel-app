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
    return Container(
      height: 750,
      child: favorites.isNotEmpty
          ? Expanded(
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 0,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.3),
                scrollDirection: Axis.vertical,
                children: List.generate(favorites.length, (index) {
                  return buildCard(index);
                }),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.heart_broken,
                      color: Colors.blue,
                      size: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "there is no favorite places",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildCard(int index) {
    return PlacesItem(
      place: favorites[index],
    );
  }
}
