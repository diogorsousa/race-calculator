import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:race_calculator/models/lap_calculator_model.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LapCalculatorModel(),
      child: MyApp(),
    ),
  );
}
