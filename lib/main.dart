import 'package:fitapp/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromRGBO(141, 110, 99, 1),
      ),
      textTheme: GoogleFonts.latoTextTheme(),
    );

    return MaterialApp(
      theme: theme,
      home: const Scaffold(
        body: TabsScreen(),
      ),
    );
  }
}
