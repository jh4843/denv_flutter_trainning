import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// for web
import 'dart:io' as io;
import 'dart:typed_data';
import 'package:universal_html/html.dart' as html;

// IO Pakcages
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PaintPageWeb extends StatefulHookConsumerWidget {
  const PaintPageWeb({super.key, required this.title});

  final String title;

  @override
  ConsumerState<PaintPageWeb> createState() => _PaintPageWebState();
}

class _PaintPageWebState extends ConsumerState<PaintPageWeb> {
  html.File? _imageFile;

  Future<String?> getBase64FromImageFile(html.File file) async {
    final reader = html.FileReader();
    final completer = Completer<String>();

    reader.onLoad.listen((event) {
      final base64String = reader.result as String;
      final imageType = file.type
          .split('/')
          .last; // Extract image type (e.g., jpg, png, etc.)
      final base64Image = base64String.split(',').last;

      completer.complete('data:image/$imageType;base64,$base64Image');
    });

    reader.onError.listen((error) {
      completer.completeError('Failed to read image file');
    });

    reader.readAsDataUrl(file);

    return completer.future;
  }

  Future<html.File?> convertIoToFile(io.File file) async {
    final completer = Completer<html.File>();

    Uint8List bytes = await file.readAsBytes();

    final blob = html.Blob([bytes]);
    final fileName = file.path.split('/').last;
    final fileType = file.path.split('.').last;
    final convertedFile =
        html.File([blob], fileName, {'type': 'image/$fileType'});

    completer.complete(convertedFile);

    return completer.future;
  }

  // Function to pick an image from local storage
  Future<html.File?> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    // convert File to html.File

    if (pickedFile != null) {
      return convertIoToFile(File(pickedFile.path));
    }

    return null;

    // final imagePicker = ImagePicker();
    // // pick image from gallery
    // final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    //   setState(() {
    //     _imageFile = File(pickedFile.path);
    //     print("file path: ${pickedFile.path} ${_imageFile!.path}");
    //   });
    // }
  }

  //Function to load image with File type to ui.Image type
  Future<Uint8List?> _fileToImage(html.File file) async {
    final completer = Completer<Uint8List>();

    final reader = html.FileReader();

    reader.onLoad.listen((event) {
      completer.complete(reader.result as Uint8List);
    });

    reader.onError.listen((error) {
      completer.completeError('Failed to read image file');
    });

    reader.readAsArrayBuffer(file);

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    // get flatform type

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //drawer: const MainDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.8),
              Colors.grey.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_imageFile != null)
                FutureBuilder<Uint8List?>(
                  future: _fileToImage(_imageFile!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return Image.memory(
                        snapshot.data!,
                        height: 200,
                        fit: BoxFit.cover, // Adjust the fit mode as needed
                      );
                    } else {
                      // Placeholder widget when image data is not available
                      return const Icon(Icons.image, size: 100);
                    }
                  },
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  html.File? pickedFile = await _pickImage();
                  // Save the picked file to a class variable (_imageFile in this case)
                  _imageFile = pickedFile;
                  // Refresh the UI when a new image is picked
                  setState(() {});
                },
                child: const Text('Pick Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
