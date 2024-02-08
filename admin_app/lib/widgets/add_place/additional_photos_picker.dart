import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AdditionalPhotosPicker extends StatefulWidget {
  final List<XFile?>? initialValue;
  final void Function(XFile)? onPhotoPicked;

  const AdditionalPhotosPicker({Key? key, this.onPhotoPicked, this.initialValue}) : super(key: key);

  @override
  _AdditionalPhotosPickerState createState() => _AdditionalPhotosPickerState();
}

class _AdditionalPhotosPickerState extends State<AdditionalPhotosPicker> {
  List<XFile> _additionalPhotos = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _additionalPhotos = List.from(widget.initialValue!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Photos:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _additionalPhotos.map((photo) {
            return GestureDetector(
              onTap: () => _removePhoto(photo),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Stack(
                  children: [
                    Image.file(
                      File(photo.path),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.white),
                          onPressed: () => _removePhoto(photo),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        _additionalPhotos.length < 3
            ? ElevatedButton(
                onPressed: _pickAdditionalImage,
                child: Text('Add Additional Photo'),
              )
            : SizedBox(),
      ],
    );
  }

  Future<void> _pickAdditionalImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final croppedFile = await _cropImage(pickedFile.path);
      if (croppedFile != null) {
        setState(() {
          _additionalPhotos.add(XFile(croppedFile.path));
        });
        if (widget.onPhotoPicked != null) {
          widget.onPhotoPicked!(XFile(croppedFile.path));
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

  void _removePhoto(XFile photo) {
    setState(() {
      _additionalPhotos.remove(photo);
    });
  }
}
