import 'package:flutter/material.dart';
import '../services/fuel_calculator_service.dart';

class FuelCalculatorPage extends StatefulWidget {
  @override
  _FuelCalculatorPageState createState() => _FuelCalculatorPageState();
}

class _FuelCalculatorPageState extends State<FuelCalculatorPage> {
  final fuelPerLapController = TextEditingController(text: "0.0");
  final tankCapacityController = TextEditingController(text: "0");
  double _fuelRequired = 0.0;

  void _calculate() {
    setState(() {
      _fuelRequired = FuelCalculatorService.calculateFuelRequired(
          double.parse(fuelPerLapController.text),
          10); // lap count needs to come from lap_calculator_page
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          getForm(),
        ],
      ),
    );
  }

  Padding getForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 10),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fuelPerLapController,
              decoration: const InputDecoration(
                labelText: 'Fuel per lap',
                filled: true,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter fuel per lap';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: tankCapacityController,
              decoration: const InputDecoration(
                labelText: 'Tank capacity',
                filled: true,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter tank capacity';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: <Widget>[
                  const ListTile(
                    title: Text('Results:'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Fuel required:'),
                    subtitle: Text(_fuelRequired.toString()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _calculate();
                },
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
