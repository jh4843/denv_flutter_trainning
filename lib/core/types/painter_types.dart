enum PathType {
  line,
  rect,
  circle,
  text,
  svg,
}

// structure for paths
class DenvPath {
  PathType type;

  int x;
  int y;

  int width;
  int height;

  String? text;

  DenvPath({
    required this.type,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.text,
  });
}
