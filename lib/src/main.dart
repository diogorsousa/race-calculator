import 'package:flutter/material.dart';

import 'lap_calculator/lap_calculator_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Race Calculator',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lap Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _totalLaps = 0;
  String _timeLeft = "00:00:00";
  String _totalTime = "00:00:00";
  final raceDurationController = TextEditingController(text: "00:20:00");
  final averageLaptimeController = TextEditingController(text: "01:39.7");

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _getTotalLaps() {
    setState(() {
      _totalLaps = LapCalculatorService.getTotalLaps(
          raceDurationController.text, averageLaptimeController.text);
      _timeLeft = LapCalculatorService.getTimeRemaining(
          raceDurationController.text, averageLaptimeController.text);
      _totalTime = LapCalculatorService.getTotalTime(
          raceDurationController.text, averageLaptimeController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getForm(),
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Padding getForm() {
    return Padding(
      padding: const EdgeInsets.all(28),
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
            Text('Results',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.left),
            const Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Total laps:'),
              subtitle: Text(_totalLaps.toString()),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Time remaining on final lap:'),
              subtitle: Text(_timeLeft),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Total time:'),
              subtitle: Text(_totalTime),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _getTotalLaps();
                },
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.timelapse),
          label: 'Laps',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.repeat),
          label: 'Fuel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_crash_outlined),
          label: 'Pit',
        ),
      ],
      currentIndex: 0,
      onTap: null,
    );
  }
}
