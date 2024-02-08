import 'package:admin_app/widgets/add_place/additional_photos_picker.dart';
import 'package:admin_app/widgets/add_place/category_dropdown.dart';
import 'package:admin_app/widgets/add_place/description_text_field.dart';
import 'package:admin_app/widgets/add_place/main_photo_picker.dart';
import 'package:admin_app/widgets/add_place/region_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  late String _selectedCategory;
  late String _regionInput;
  late String _name;
  late String _description;
  late XFile? _mainPhotoFile;
  List<XFile> _additionalPhotos = [];
  List<String> _categories = ['Restaurant', 'Museum', 'Cafe'];

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first;
    _regionInput = '';
    _name = '';
    _description = '';
    _mainPhotoFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              CategoryDropdown(
                selectedCategory: _selectedCategory,
                categories: _categories,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value.toString();
                  });
                },
              ),
              SizedBox(height: 20),
              RegionInput(
                labelText: 'Region',
                onChanged: (value) {
                  setState(() {
                    _regionInput = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              DescriptionTextField(
                onChanged: (value) {
                  setState(() {
                    _description = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              MainPhotoPicker(
                onPhotoPicked: (photo) {
                  setState(() {
                    _mainPhotoFile = photo;
                  });
                },
              ),
              SizedBox(height: 20),
              AdditionalPhotosPicker(
                onPhotoPicked: (photo) {
                  if (photo != null) {
                    setState(() {
                      _additionalPhotos.add(photo);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addItem();
                },
                child: Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    try {
      await FirebaseFirestore.instance.collection('places').add({
        'category': _selectedCategory,
        'description': _description,
        'name': _name,
        'rating': 4.3,
        'state': _regionInput, // Use region instead of state
      });
      // Successfully added restaurant data
      print('Restaurant data added to Firestore');
    } catch (e) {
      // Error occurred while adding data
      print('Error adding restaurant data: $e');
    }
  }
}
