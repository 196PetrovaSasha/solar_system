import 'package:flutter/material.dart';

import '../../models/sun.dart';

class SunWidget extends StatelessWidget {

  final double initialSize = 70;
  static double factor = 1;

  const SunWidget({super.key});

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
