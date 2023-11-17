import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:race_calculator/models/lap_calculator_model.dart';
import '../models/fuel_calculator_model.dart';
import '../services/fuel_calculator_service.dart';

class FuelCalculatorPage extends StatefulWidget {
  @override
  _FuelCalculatorPageState createState() => _FuelCalculatorPageState();
}

class _FuelCalculatorPageState extends State<FuelCalculatorPage> {
  TextEditingController? fuelPerLapController;
  TextEditingController? tankCapacityController;
  double _fuelRequired = 0.0;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fuelPerLapController = TextEditingController(
        text: Provider.of<FuelCalculatorModel>(context, listen: false)
            .fuelPerLap
            .toString());
    tankCapacityController = TextEditingController(
        text: Provider.of<FuelCalculatorModel>(context, listen: false)
            .tankCapacity
            .toString());

    _fuelRequired =
        Provider.of<FuelCalculatorModel>(context, listen: false).fuelRequired;
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        var totalLaps = context.read<LapCalculatorModel>().totalLaps;
        _fuelRequired = FuelCalculatorService.calculateFuelRequired(
            double.parse(fuelPerLapController!.text), totalLaps);

        // set shared state in LapCalculatorModel
        Provider.of<FuelCalculatorModel>(context, listen: false).fuelRequired =
            _fuelRequired;
        Provider.of<FuelCalculatorModel>(context, listen: false).fuelPerLap =
            double.parse(fuelPerLapController!.text);
        Provider.of<FuelCalculatorModel>(context, listen: false).tankCapacity =
            int.parse(tankCapacityController!.text);
      });
    }
  }

  bool isValidTankCapacity(String input) {
    return int.tryParse(input) != null;
  }

  bool isValidFuelPerLap(String input) {
    double? value = double.tryParse(input);
    return value != null && value.toString() == input;
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
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fuelPerLapController,
              decoration: const InputDecoration(
                labelText: 'Fuel per lap',
                helperText: " ",
                filled: true,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter fuel per lap';
                } else if (!isValidFuelPerLap(value)) {
                  return 'Invalid format. Please enter a number in the format #.#';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: tankCapacityController,
              decoration: const InputDecoration(
                labelText: 'Tank capacity',
                helperText: " ",
                filled: true,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter tank capacity';
                } else if (!isValidTankCapacity(value)) {
                  return 'Invalid format. Please enter a number';
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
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
