import 'package:flutter/material.dart';
import 'dart:ui' as ui;
//import 'dart:typed_data';

// widget that receives ui.Image as a parameter and display image
// in this widget, we can draw line, rectangle, circle, text, etc. on image.
// we can also draw svg image on image.
class DenvImagePainter extends CustomPainter {
  final ui.Image image;

  DenvImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    print("image size: $size");

    //canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw the loaded image
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
