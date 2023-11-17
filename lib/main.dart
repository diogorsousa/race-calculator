import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:race_calculator/app.dart';
import 'models/fuel_calculator_model.dart';
import 'models/lap_calculator_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LapCalculatorModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FuelCalculatorModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}
