import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  const CardPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var rect = Rect.fromPoints(Offset(width - 85, 0), Offset(width, height));
    var paint = Paint()
      ..shader = (LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
        Colors.white.withAlpha(100),
        Colors.white.withAlpha(0),
      ]).createShader(rect))
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(width - 20, 0);
    path.quadraticBezierTo(8.4 * width / 12, (height / 2) - 15, width - 85, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AppBarPainter extends CustomPainter {
  AppBarPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    var rect = Rect.fromPoints(Offset.zero, Offset(width, height / 3));
    var paint = Paint()
      ..shader = (const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomRight, colors: [
        Color(0xffd770e8),
        Color(0xffa94cf1),
      ]).createShader(rect))
      ..style = PaintingStyle.fill;

    double x = 7 * width / 8;
    double y = 3 * height / 10;

    double dx = 20;
    double dy = 35;

    var path = Path();
    path.lineTo(0, y);
    path.lineTo(x - dx, y + dy);
    path.quadraticBezierTo(x, y + dy, x + dx - 8, y + dy - 10);
    path.lineTo(width, y + 0);
    path.lineTo(width, 0);
    path.close();

    canvas.drawShadow(path, color, 3, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
