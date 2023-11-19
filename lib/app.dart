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
      theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal))
          .copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: const AppShell(title: 'Lap Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}
