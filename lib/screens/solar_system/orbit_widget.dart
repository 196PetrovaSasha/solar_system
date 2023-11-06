import 'package:flutter/material.dart';

class OrbitWidget extends StatefulWidget {
  final double radius;

  OrbitWidget({required this.radius});

  @override
  _OrbitWidgetState createState() => _OrbitWidgetState();
}

class _OrbitWidgetState extends State<OrbitWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: OrbitPainter(widget.radius),
    );
  }
}

class OrbitPainter extends CustomPainter {
  final double radius;

  OrbitPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(OrbitPainter oldDelegate) {
    return oldDelegate.radius != radius;
  }
}
