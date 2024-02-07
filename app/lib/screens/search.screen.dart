import 'package:app/interfaces/i.place.dart';
import 'package:app/widgets/placesList/places.item.dart';
import 'package:app/widgets/ui/home.title.dart';
import 'package:app/widgets/ui/like.button.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchScreen> {
  late FocusNode _focusNode;
  bool _isSearching = false;

  static List<IPlace> places = [
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

  List<IPlace> displayPlaces = List.from(places);

  // Filtering the places based on search query
  void updatePlacesList(String value) {
    setState(() {
      displayPlaces = places
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isSearching = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SearchBody(
        focusNode: _focusNode,
        isSearching: _isSearching,
        updatePlacesList: updatePlacesList,
        displayPlaces: displayPlaces,
        buildCard: buildCard,
      ),
    );
  }

  Widget buildCard(int index) {
    return PlacesItem(
      place: displayPlaces[index],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        "Explore",
        style: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
    );
  }
}

class SearchBody extends StatelessWidget {
  final FocusNode focusNode;
  final bool isSearching;
  final Function(String) updatePlacesList;
  final List<IPlace> displayPlaces;
  final Widget Function(int) buildCard;

  SearchBody({
    required this.focusNode,
    required this.isSearching,
    required this.updatePlacesList,
    required this.displayPlaces,
    required this.buildCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            focusNode: focusNode,
            isSearching: isSearching,
            updatePlacesList: updatePlacesList,
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: displayPlaces.isEmpty
                ? Center(
                    child: Text(
                      "No Results",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : PlacesGrid(
                    displayPlaces: displayPlaces,
                    buildCard: buildCard,
                  ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final FocusNode focusNode;
  final bool isSearching;
  final Function(String) updatePlacesList;

  SearchBar({
    required this.focusNode,
    required this.isSearching,
    required this.updatePlacesList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          onChanged: updatePlacesList,
          focusNode: focusNode,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            filled: true,
            fillColor: Color.fromARGB(255, 248, 243, 243),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            hintText: "Search ...",
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        if (isSearching)
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CloseButton(),
          ),
      ],
    );
  }
}

class PlacesGrid extends StatelessWidget {
  final List<IPlace> displayPlaces;
  final Widget Function(int) buildCard;

  PlacesGrid({
    required this.displayPlaces,
    required this.buildCard,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 2,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.3),
      scrollDirection: Axis.vertical,
      children: List.generate(displayPlaces.length, (index) {
        return buildCard(index);
      }),
    );
  }
}
