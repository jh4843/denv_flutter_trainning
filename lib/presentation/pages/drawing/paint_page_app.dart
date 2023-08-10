import 'dart:async';

import 'package:denv_flutter_training/core/types/painter_types.dart';
import 'package:denv_flutter_training/presentation/widgets/denv_shape_painter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:denv_flutter_training/presentation/widgets/denv_image_patinter.dart';

import 'dart:ui' as ui;

// IO Pakcages
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class PaintPageApp extends StatefulHookConsumerWidget {
  const PaintPageApp({super.key, required this.title});

  final String title;

  @override
  ConsumerState<PaintPageApp> createState() => _PaintPageAppState();
}

class _PaintPageAppState extends ConsumerState<PaintPageApp> {
  File? _imageFile;

  final List<DenvPath> _paths = [];

  // Function to pick an image from local storage
  Future<File?> _pickImageApp() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }

    return null;
  }

  //Function to load image with File type to ui.Image type
  Future<ui.Image?> _fileToImage(File file) async {
    print("path: ${file.path}");

    try {
      if (!kIsWeb) {
        final appDir = await getApplicationDocumentsDirectory();
        final filePath = "${appDir.path}/${file.path.split('/').last}";

        print("filePath: $filePath");
      }

      final bytes = await file.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frameInfo = await codec.getNextFrame();

      return frameInfo.image;
    } catch (e) {
      print("Error: $e");
    }

    return null;
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
                SizedBox(
                  width: 300,
                  height: 300,
                  child: FutureBuilder<ui.Image?>(
                    future: _fileToImage(_imageFile!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: InteractiveViewer(
                            boundaryMargin: const EdgeInsets.symmetric(
                              horizontal: 300 / 2,
                              vertical: 300 / 2,
                            ),
                            panEnabled: true,
                            child: CustomPaint(
                              foregroundPainter:
                                  DenvShapePainter(paths: _paths),
                              painter:
                                  DenvImagePainter(snapshot.data as ui.Image),
                            ),
                          ),
                        );
                      } else {
                        // Placeholder widget when image data is not available
                        return const Icon(Icons.image, size: 100);
                      }
                    },
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  File? pickedFile = await _pickImageApp();
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
