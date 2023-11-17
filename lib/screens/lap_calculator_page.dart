import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:race_calculator/models/lap_calculator_model.dart';
import '../services/lap_calculator_service.dart';

class LapCalculatorPage extends StatefulWidget {
  @override
  _LapCalculatorPageState createState() => _LapCalculatorPageState();
}

class _LapCalculatorPageState extends State<LapCalculatorPage> {
  int _totalLaps = 0;
  String _timeLeft = "00:00:00";
  String _totalTime = "00:00:00";
  final raceDurationController = TextEditingController(text: "00:00:00");
  final averageLaptimeController = TextEditingController(text: "00:00.0");

  void _calculate() {
    setState(() {
      _totalLaps = LapCalculatorService.getTotalLaps(
          raceDurationController.text, averageLaptimeController.text);
      Provider.of<LapCalculatorModel>(context, listen: false).totalLaps =
          _totalLaps;

      _timeLeft = LapCalculatorService.getTimeRemaining(
          raceDurationController.text, averageLaptimeController.text);
      _totalTime = LapCalculatorService.getTotalTime(
          raceDurationController.text, averageLaptimeController.text);
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
              controller: raceDurationController,
              decoration: const InputDecoration(
                labelText: 'Race Duration',
                helperText: "hrs:min:sec",
                filled: true,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter race duration';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: averageLaptimeController,
              decoration: const InputDecoration(
                labelText: 'Average Laptime',
                helperText: "min:sec.ms",
                filled: true,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter average laptime';
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
                    title: const Text('Total laps:'),
                    subtitle: Text(_totalLaps.toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Time remaining on final lap:'),
                    subtitle: Text(_timeLeft),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Total time:'),
                    subtitle: Text(_totalTime),
                  )
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