import 'package:flutter/material.dart';
import 'package:denv_flutter_training/core/types/painter_types.dart';
//import 'dart:typed_data';

// widget that receives ui.Image as a parameter and display image
// in this widget, we can draw line, rectangle, circle, text, etc. on image.
// we can also draw svg image on image.
class DenvShapePainter extends CustomPainter {
  final List<DenvPath> paths;
  DenvShapePainter({required this.paths});

  @override
  void paint(Canvas canvas, Size size) {
    print("shape size: $size");

    // Example: Draw a red circle in the center of the image
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    const radius = 50.0;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}