import 'package:flutter/material.dart';
import 'package:solar_system/screens/solar_system/orbit_widget.dart';
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
  List<OrbitWidget> orbits = [];
  double factor = 1;
  bool isChecked = false;

  final sunInitRad = 70;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (planets.isNotEmpty) {
      if (planets.last.planet.distance + planets.last.planet.radius >
          screenWidth) {
        double scaleFactor = screenWidth /
            (planets.last.planet.distance + planets.last.planet.radius);

        List<PlanetWidget> newPlanets = [];
        List<OrbitWidget> newOrbits = [];

        for (var planet in planets) {
          Planet newPlanet = Planet(
              radius: planet.planet.radius * scaleFactor,
              color: planet.planet.color,
              distance: planet.planet.distance * scaleFactor,
              rotationSpeed:
              (planet.planet.rotationSpeed * scaleFactor).toInt());
          newPlanets.add(PlanetWidget(planet: newPlanet));
          newOrbits.add(OrbitWidget(radius: (newPlanet.distance - newPlanet.radius) / 2));
        }

        planets = newPlanets;
        orbits = newOrbits;
        factor *= scaleFactor;
      }
    }
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Switch(
            value: isChecked, // Значение Checkbox
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SunWidget(factor: factor,),
            if (isChecked) ...orbits,
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
                  builder: (context) =>  AddPlanetScreen(
                        title: "", sunRad: factor * sunInitRad,
                      )),
            );
            setState(() {
              planets.add(newPlanet);
              orbits.add(OrbitWidget(radius: (newPlanet.planet.distance - newPlanet.planet.radius) / 2));
            });
          }),
    );
  }
}
