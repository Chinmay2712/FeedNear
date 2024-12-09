import 'package:flutter/material.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 85); // Move to bottom-left, 100 px above the base
    path.quadraticBezierTo(
      size.width / 2, // Control point horizontally centered
      size.height + 85, // Control point 100 px below the base
      size.width, // Move to bottom-right
      size.height - 85, // 100 px above the base
    );
    path.lineTo(size.width, 0); // Line to top-right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
