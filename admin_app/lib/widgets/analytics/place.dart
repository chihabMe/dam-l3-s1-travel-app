import 'package:admin_app/widgets/analytics/edit_place.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Place {
  final String name;
  final String region;
  final String category;
  final String description;
  final XFile? mainPhoto;
  final List<XFile?> additionalPhotos;

  Place({
    required this.name,
    required this.region,
    required this.category,
    required this.description,
    required this.mainPhoto,
    required this.additionalPhotos,
  });
}

class PlaceListScreen extends StatefulWidget {
  @override
  _PlaceListScreenState createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  List<Place> _places = [
    Place(
      name: 'Place 1',
      region: 'Region 1',
      category: 'Category 1',
      description: 'Description for Place 1',
      mainPhoto: null,
      additionalPhotos: [],
    ),
    Place(
      name: 'Place 2',
      region: 'Region 2',
      category: 'Category 2',
      description: 'Description for Place 2',
      mainPhoto: null,
      additionalPhotos: [],
    ),
    // Add more places as needed
  ];

  void _updatePlace(Place editedPlace, int index) {
    setState(() {
      _places[index] = editedPlace;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places List'),
      ),
      body: ListView.builder(
        itemCount: _places.length,
        itemBuilder: (context, index) {
          Place place = _places[index];
          return ListTile(
            leading: CircleAvatar(
            ),
            title: Text(place.name),
            subtitle: Text(place.region),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPlaceScreen(
                          place: place,
                          onUpdatePlace: (editedPlace) {
                            _updatePlace(editedPlace, index);
                          },
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _places.removeAt(index);
                    });
                  },
                ),
              ],
            ),
            onTap: () {
              // Handle tapping on the place
              // Navigate to place detail screen or perform other action
            },
          );
        },
      ),
    );
  }
}
