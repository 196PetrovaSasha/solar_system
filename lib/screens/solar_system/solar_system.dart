import 'package:flutter/material.dart';
import 'package:solar_system/screens/solar_system/sun_widget.dart';
import 'package:solar_system/screens/solar_system/planet_widget.dart';

import '../../models/planet.dart';
import '../add_planet/add_planet.dart';

class PlanetSystemScreen extends StatefulWidget {
  final String title;

  const PlanetSystemScreen({super.key, required this.title});

  @override
  State<PlanetSystemScreen> createState() => _PlanetSystemState();
}

class _PlanetSystemState extends State<PlanetSystemScreen> {
  List<PlanetWidget> planets = [];
  double factor = 1;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (planets.isNotEmpty) {
      if (planets.last.planet.distance + planets.last.planet.radius >
          screenWidth) {
        double scaleFactor = screenWidth /
            (planets.last.planet.distance + planets.last.planet.radius);

        List<PlanetWidget> newPlanets = [];

        for (var planet in planets) {
          newPlanets.add(PlanetWidget(
              planet: Planet(
                  radius: planet.planet.radius * scaleFactor,
                  color: planet.planet.color,
                  distance: planet.planet.distance * scaleFactor,
                  rotationSpeed:
                      (planet.planet.rotationSpeed * scaleFactor).toInt())));
        }

        planets = newPlanets;
        factor *= scaleFactor;
      }
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SunWidget(factor: factor,),
            ...planets,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final PlanetWidget newPlanet = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddPlanetScreen(
                        title: "",
                      )),
            );
            setState(() {
              planets.add(newPlanet);
            });
          }),
    );
  }
}
