import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Planet {

  final double radius;
  final Color color;
  final double distance;
  final int rotationSpeed;

  Planet({
    required this.radius,
    required this.color,
    required this.distance,
    required this.rotationSpeed,
  });
}
