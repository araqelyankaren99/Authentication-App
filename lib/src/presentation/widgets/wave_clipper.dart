import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  const WaveClipper();
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    path.cubicTo(
      size.width * 2/5,
      size.height * 0.95,
      size.width * 4/5,
      size.height * 0.25,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}