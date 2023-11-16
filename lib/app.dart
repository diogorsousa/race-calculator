import 'package:flutter/material.dart';
import 'screens/app_shell_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Race Calculator',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark()
            .copyWith(primary: const Color.fromARGB(255, 50, 146, 130)),
        useMaterial3: true,
      ),
      home: const AppShell(title: 'Lap Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}
