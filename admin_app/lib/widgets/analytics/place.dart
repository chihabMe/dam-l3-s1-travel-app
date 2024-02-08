import 'package:admin_app/widgets/analytics/edit_place.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceListScreen extends StatefulWidget {
  @override
  _PlaceListScreenState createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _deletePlace(String documentId) async {
    try {
      await _firestore.collection('places').doc(documentId).delete();
    } catch (e) {
      print('Error deleting place: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('places').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final placeData = documents[index].data() as Map<String, dynamic>;
              final String documentId = documents[index].id;
              final String name = placeData['name'] ?? '';
              final String region = placeData['region'] ?? '';
              final String category = placeData['category'] ?? '';
              final String description = placeData['description'] ?? '';

              return ListTile(
                leading: Icon(Icons.photo),
                title: Text(name),
                subtitle: Text(region),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Navigate to the EditPlaceScreen with the selected place
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPlaceScreen(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Place'),
                              content: Text('Are you sure you want to delete this place?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _deletePlace(documentId);
                                    Navigator.pop(context);
                                  },
                                  child: Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Handle tapping on the place
                },
              );
            },
          );
        },
      ),
    );
  }
}
