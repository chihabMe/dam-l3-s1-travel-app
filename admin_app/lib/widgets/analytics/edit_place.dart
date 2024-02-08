import 'package:admin_app/widgets/add_place/additional_photos_picker.dart';
import 'package:admin_app/widgets/add_place/main_photo_picker.dart';
import 'package:admin_app/widgets/analytics/place.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Add imports for necessary packages and widgets

class EditPlaceScreen extends StatefulWidget {

  @override
  _EditPlaceScreenState createState() => _EditPlaceScreenState();
}

class _EditPlaceScreenState extends State<EditPlaceScreen> {
  late String _selectedCategory;
  late String _regionInput;
  late String _name;
  late String _description;
  XFile? _mainPhotoFile;
  List<XFile?> _additionalPhotos = []; // Change to nullable XFile
  List<String> _categories = ['Restaurant', 'Museum', 'Cafe'];

  @override
  void initState() {
    super.initState();
    // Initialize the state with existing place data
    _selectedCategory = 'Cafe';
    _regionInput = 'Alger';
    _name = 'Name';
    _description = 'Des';
    _mainPhotoFile = null;
    _additionalPhotos = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _regionInput,
                onChanged: (value) {
                  setState(() {
                    _regionInput = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Region',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _name,
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
              TextFormField(
                initialValue: _description,
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
              SizedBox(height: 20),
              MainPhotoPicker(
                initialValue: _mainPhotoFile,
                onPhotoPicked: (photo) {
                  setState(() {
                    _mainPhotoFile = photo;
                  });
                },
              ),
              SizedBox(height: 20),
              AdditionalPhotosPicker(
                initialValue: _additionalPhotos,
                onPhotoPicked: (photo) {
                  setState(() {
                    _additionalPhotos.add(photo);
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Update place logic here
                  // After updating the place, you can navigate back or perform other actions
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
