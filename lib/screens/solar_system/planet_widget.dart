import 'package:flutter/material.dart';

import '../../models/planet.dart';

class PlanetWidget extends StatefulWidget {
  final Planet planet;

  const PlanetWidget({super.key, required this.planet});

  @override
  State<PlanetWidget> createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);

    controller.repeat(
        min: 0.0,
        max: 1.0,
        period: Duration(seconds: widget.planet.rotationSpeed));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.planet.distance,
        width: widget.planet.distance,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            RotationTransition(
              turns: controller,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: widget.planet.radius,
                  width: widget.planet.radius,
                  decoration: BoxDecoration(
                    color: widget.planet.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
