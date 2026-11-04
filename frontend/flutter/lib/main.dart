import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme/app_theme.dart';

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
      theme: buildEduPathTheme(),
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
