import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system/screens/solar_system/planet_widget.dart';
import 'package:solar_system/screens/solar_system/solar_system.dart';

import 'models/planet.dart';

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planet System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlanetSystemScreen(title: 'Planet System'),
    );
  }
}
