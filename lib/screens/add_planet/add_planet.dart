import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solar_system/screens/solar_system/sun_widget.dart';

import '../../models/planet.dart';
import '../solar_system/planet_widget.dart';

class AddPlanetScreen extends StatefulWidget {
  final String title;

  const AddPlanetScreen({super.key, required this.title});

  @override
  _AddPlanetScreenState createState() => _AddPlanetScreenState();
}

class _AddPlanetScreenState extends State<AddPlanetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _radiusController = TextEditingController();
  final _distanceController = TextEditingController();
  final _rotationSpeedController = TextEditingController();

  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  // SunWidget sun = const SunWidget();

  void changeColor(Color color) => setState(() => currentColor = color);

  Widget getRadius() {
    return TextFormField(
      controller: _radiusController,
      decoration: const InputDecoration(
        labelText: 'Radius of planet',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter radius';
        } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
          return 'Radius must be a positive integer number';
        }
        return null;
      },
    );
  }

  Widget getDistance() {
    return TextFormField(
      controller: _distanceController,
      decoration: const InputDecoration(
        labelText: 'Distance from center',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter distance';
        } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
          return 'Distance must be a positive integer number';
        }
        return null;
      },
    );
  }

  Widget getSpeed() {
    return TextFormField(
      controller: _rotationSpeedController,
      decoration: const InputDecoration(
        labelText: 'Rotation Speed (time for a complete rotation sec)',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter rotation speed';
        } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
          return 'Rotation speed must be a positive double value';
        }
        return null;
      },
    );
  }

  Widget getColor() {
    return SizedBox(
        height: 300,
        child: Column(
          children: [
            Expanded(
                child: MaterialPicker(
                    pickerColor: currentColor, onColorChanged: changeColor))
          ],
        ));
  }

  Widget addButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          double radius = double.parse(_radiusController.text);
          Color color = currentColor;
          double distance = double.parse(_distanceController.text);
          double rotationSpeed = double.parse(_rotationSpeedController.text);

          // if (distance - radius > sun.initialSize * SunWidget.factor) {
          //   Planet planet = Planet(
          //     radius: radius,
          //     color: color,
          //     distance: distance,
          //     rotationSpeed: (rotationSpeed * 1000000).toInt(),
          //   );
          //   PlanetWidget newPlanet = PlanetWidget(planet: planet);
          //   Navigator.pop(context, newPlanet);
          // } else {
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //       content: Text('Please correct distance, too small')));
          // }
          Planet planet = Planet(
            radius: radius,
            color: color,
            distance: distance,
            rotationSpeed: (rotationSpeed * 1000000).toInt(),
          );
          PlanetWidget newPlanet = PlanetWidget(planet: planet);
          Navigator.pop(context, newPlanet);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please correct the errors')));
        }
      },
      child: const Text('Add Planet'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Planet'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    getRadius(),
                    getDistance(),
                    getSpeed(),
                    const Text(""),
                    getColor(),
                    const Text(""),
                    const Text(""),
                    addButton(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
