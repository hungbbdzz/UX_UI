import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(const FigmaEduPathApp());
}

class FigmaEduPathApp extends StatelessWidget {
  const FigmaEduPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPath Prototype (Figma Extracted)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A14B4),
          primary: const Color(0xFF2A14B4),
          secondary: const Color(0xFFFD761A),
          surface: const Color(0xFFF9F9FF),
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
