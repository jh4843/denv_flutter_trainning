import 'package:flutter/material.dart';
import 'package:denv_flutter_training/core/types/painter_types.dart';
//import 'dart:typed_data';

// widget that receives ui.Image as a parameter and display image
// in this widget, we can draw line, rectangle, circle, text, etc. on image.
// we can also draw svg image on image.
class DenvShapePainter extends CustomPainter {
  final List<DenvPath> paths;
  DenvShapePainter({required this.paths});

  // function for _drawLine
  void _drawLine(Canvas canvas, DenvPath path) {
    final paint = Paint()
      ..color = path.color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = path.strokeWidth!.toDouble();

    canvas.drawLine(
      Offset(path.x.toDouble(), path.y.toDouble()),
      Offset(path.width.toDouble(), path.height.toDouble()),
      paint,
    );
  }

  // function for _drawRect
  void _drawRect(Canvas canvas, DenvPath path) {
    final paint = Paint()
      ..color = path.color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = path.strokeWidth!.toDouble();

    canvas.drawRect(
      Rect.fromLTWH(
        path.x.toDouble(),
        path.y.toDouble(),
        path.width.toDouble(),
        path.height.toDouble(),
      ),
      paint,
    );
  }

  // function for _drawCircle
  void _drawCircle(Canvas canvas, DenvPath path) {
    final paint = Paint()
      ..color = path.color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = path.strokeWidth!.toDouble();

    canvas.drawCircle(
      Offset(path.x.toDouble(), path.y.toDouble()),
      path.width.toDouble(),
      paint,
    );
  }

  // function for _drawText
  void _drawText(Canvas canvas, DenvPath path) {
    final textStyle = TextStyle(
      color: path.color ?? Colors.black,
      fontSize: 20,
    );

    final textSpan = TextSpan(
      text: path.text,
      style: textStyle,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: path.width.toDouble(),
    );

    textPainter.paint(
      canvas,
      Offset(path.x.toDouble(), path.y.toDouble()),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    print("shape size: $size");

    // draw paths
    for (var path in paths) {
      switch (path.type) {
        case PathType.line:
          _drawLine(canvas, path);
          break;
        case PathType.rect:
          _drawRect(canvas, path);
          break;
        case PathType.circle:
          _drawCircle(canvas, path);
          break;
        case PathType.text:
          _drawText(canvas, path);
          break;
        default:
          print("unknown path type");
          break;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
