import 'package:flutter/material.dart';

enum PainterMode {
  select,
  //
  manipulatePan,
  manipulateZoom,
  //
  drawLine,
  drawRect,
  drawCircle,
  drawText,
  erase,
  //
}

enum PathType {
  line,
  rect,
  circle,
  text,
}

// structure for paths
class DenvPath {
  PathType type;

  int x;
  int y;

  int width;
  int height;

  String? text;

  Color? color = Colors.black;
  int? strokeWidth = 5;

  DenvPath({
    required this.type,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.text,
    this.color,
    this.strokeWidth,
  });
}
