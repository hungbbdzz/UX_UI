import 'package:flutter/material.dart';

import 'figma_tokens.dart';

ThemeData buildEduPathTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: FigmaFonts.inter,
    scaffoldBackgroundColor: FigmaColors.surface,
    colorScheme: ColorScheme.fromSeed(
      seedColor: FigmaColors.primary,
      primary: FigmaColors.primary,
      secondary: FigmaColors.secondary,
      surface: FigmaColors.surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: FigmaColors.surface,
      foregroundColor: FigmaColors.textPrimary,
      elevation: 0,
      centerTitle: false,
    ),
    splashFactory: InkSparkle.splashFactory,
  );
}
