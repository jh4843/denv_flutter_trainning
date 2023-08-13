import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// for web
import 'package:file_picker/file_picker.dart';

// IO Pakcages

class PaintPageWeb extends StatefulHookConsumerWidget {
  const PaintPageWeb({super.key, required this.title});

  final String title;

  @override
  ConsumerState<PaintPageWeb> createState() => _PaintPageWebState();
}

class _PaintPageWebState extends ConsumerState<PaintPageWeb> {
  FilePickerResult? _pickedImage;

  // Function to pick an image from local storage
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _pickedImage = result;
      });
    }
  }

  //Function to load image with File type to ui.Image type
  Future<Image?> _fileToImage(FilePickerResult file) async {
    if (file == null) return null;

    Image img = Image.memory(
      file.files.first.bytes!,
      fit: BoxFit.cover,
    );

    return img;
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
              if (_pickedImage != null)
                FutureBuilder<Image?>(
                  future: _fileToImage(_pickedImage!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return snapshot.data!;
                    } else {
                      // Placeholder widget when image data is not available
                      return const Icon(Icons.image, size: 100);
                    }
                  },
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pick Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
