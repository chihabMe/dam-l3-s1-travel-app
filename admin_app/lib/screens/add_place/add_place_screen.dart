import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  late String _selectedCategory;
  late String _selectedRegion;
  late String _name;
  late String _description;
  late XFile? _mainPhotoFile;

  List<String> _categories = ['Restaurant', 'Museum', 'Cafe'];
  List<String> _regions = ['Constantine', 'Algiers', 'Biskra'];

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories.first;
    _selectedRegion = _regions.first;
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
              _buildMainPhotoWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainPhotoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Main Photo:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _pickMainImage,
          child: Text('Add Main Photo'),
        ),
        SizedBox(height: 10),
        _mainPhotoFile != null
            ? Image.file(File(_mainPhotoFile!.path))
            : Container(),
      ],
    );
  }

  Future<void> _pickMainImage() async {
  final PermissionStatus permissionStatus = await Permission.photos.request(); // Request permission for accessing photos
  if (permissionStatus.isGranted) {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _mainPhotoFile = XFile(pickedFile.path);
      });
    }
  } else if (permissionStatus.isDenied) {
    // Handle case when permission is denied
    _showPermissionDeniedDialog();
  }
}


  Future<void> _showPermissionDeniedDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Denied'),
        content: Text('You denied permission to access storage. Would you like to grant permission now?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Open app settings to allow the user to grant permission manually
              openAppSettings();
            },
            child: Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
