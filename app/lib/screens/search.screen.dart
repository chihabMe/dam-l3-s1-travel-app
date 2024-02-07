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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
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
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  onChanged: (value) => updatePlacesList(value),
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 243, 243),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: _isSearching ? Colors.blue : Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
                if (_isSearching)
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isSearching = false;
                          _focusNode.unfocus();
                        });
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: displayPlaces.length == 0
                  ? Center(
                      child: Text("No Results",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8, // Adjust as needed
                        mainAxisSpacing: 10.0, // Add spacing between rows
                        crossAxisSpacing: 10.0, // Add spacing between columns
                      ),
                      itemCount: displayPlaces.length,
                      itemBuilder: (context, index) {
                        final place = displayPlaces[index];
                        return PlacesItem(place: place);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}