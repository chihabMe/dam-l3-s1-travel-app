import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart'; // Import the image_cropper package

class MainPhotoPicker extends StatefulWidget {
  final void Function(XFile?)? onPhotoPicked; // Changed to accept nullable XFile

  const MainPhotoPicker({Key? key, this.onPhotoPicked}) : super(key: key);

  @override
  _MainPhotoPickerState createState() => _MainPhotoPickerState();
}

class _MainPhotoPickerState extends State<MainPhotoPicker> {
  XFile? _mainPhotoFile;

  @override
  Widget build(BuildContext context) {
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
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final croppedFile = await _cropImage(pickedFile.path); // Crop the picked image
      if (croppedFile != null) {
        setState(() {
          _mainPhotoFile = XFile(croppedFile.path);
        });
        if (widget.onPhotoPicked != null) {
          widget.onPhotoPicked!(_mainPhotoFile); // Call the onPhotoPicked callback with the cropped file
        }
      }
    }
  }

  Future<File?> _cropImage(String imagePath) async {
    File? croppedFile;
    try {
      final cropped = await ImageCropper().cropImage(
        sourcePath: imagePath,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
      );
      croppedFile = File(cropped!.path);
    } catch (e) {
      print('Error cropping image: $e');
    }
    return croppedFile;
  }
}
