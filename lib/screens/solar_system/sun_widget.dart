import 'package:flutter/material.dart';

class SunWidget extends StatelessWidget {
  final double initialSize = 70;

  double factor;

  SunWidget({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: initialSize * factor,
          height: initialSize * factor,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow,
          ),
        );
      },
    );
  }
}
