import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';

class DenvImagePicker extends StatefulWidget {
  const DenvImagePicker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DenvImagePickerState createState() => _DenvImagePickerState();
}

class _DenvImagePickerState extends State<DenvImagePicker> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    // pick image from gallery
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker & Drawing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null)
              Image.file(
                _imageFile!,
                height: 200,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
