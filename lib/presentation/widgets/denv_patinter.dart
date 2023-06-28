import 'package:flutter/material.dart';
import 'dart:ui' as ui;
//import 'dart:typed_data';

class ImagePainter extends CustomPainter {
  ImagePainter({
    this.image,
  });

  ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) {
    //ByteData data = image.toByteData()
    canvas.drawImage(image!, const Offset(0.0, 0.0), Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
