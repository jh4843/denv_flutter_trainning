import 'dart:async';

import 'package:denv_flutter_training/core/types/painter_types.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:denv_flutter_training/presentation/widgets/painters/denv_shape_painter.dart';
import 'package:denv_flutter_training/presentation/widgets/painters/denv_image_painter.dart';

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

class _PaintPageAppState extends ConsumerState<PaintPageApp>
    with TickerProviderStateMixin {
  File? _imageFile;
  PainterMode _oldPainterMode = PainterMode.select;
  PainterMode _painterMode = PainterMode.select;

  final TransformationController _transformationController =
      TransformationController();

  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;

  final List<DenvPath> _paths = [
    DenvPath(
        type: PathType.circle,
        x: 150,
        y: 200,
        width: 10,
        height: 20,
        color: Colors.blue,
        strokeWidth: 2),
  ];

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

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  // Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    print("onInteractionStart");
    print("details: $details");

    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  // initState function
  @override
  void initState() {
    super.initState();

    _controllerReset = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  // dispose function
  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get flatform type

    FocusNode focusNode = FocusNode();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
              Colors.blue.withOpacity(1),
              Colors.white.withOpacity(1),
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
                          child: RawKeyboardListener(
                            autofocus: true,
                            focusNode: focusNode,
                            onKey: (event) {
                              if (event.isControlPressed &&
                                  _painterMode != PainterMode.manipulatePan) {
                                _oldPainterMode = _painterMode;
                                _painterMode = PainterMode.manipulatePan;
                                print(
                                    "mode changed to $_painterMode from $_oldPainterMode");
                                print(
                                    "transform controller \n${_transformationController.value}");
                                setState(() {});
                              } else if (!event.isControlPressed &&
                                  _painterMode == PainterMode.manipulatePan) {
                                _painterMode = _oldPainterMode;
                                print(
                                    "mode changed to $_painterMode from $_oldPainterMode");
                                print(
                                    "transform controller \n${_transformationController.value}");
                                setState(() {});
                              }
                            },
                            child: InteractiveViewer(
                              transformationController:
                                  _transformationController,
                              boundaryMargin: const EdgeInsets.symmetric(
                                horizontal: 300 / 2,
                                vertical: 300 / 2,
                              ),
                              onInteractionStart: _onInteractionStart,
                              panEnabled:
                                  _painterMode == PainterMode.manipulatePan
                                      ? true
                                      : false,
                              child: CustomPaint(
                                foregroundPainter:
                                    DenvShapePainter(paths: _paths),
                                painter:
                                    DenvImagePainter(snapshot.data as ui.Image),
                              ),
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
      persistentFooterButtons: <Widget>[
        IconButton(
          onPressed: _animateResetInitialize,
          tooltip: 'Reset',
          color: Theme.of(context).colorScheme.inversePrimary,
          icon: const Icon(Icons.replay),
        ),
      ],
    );
  }
}
