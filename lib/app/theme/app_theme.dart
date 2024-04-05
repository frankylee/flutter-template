import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData darkTheme = FlexThemeData.dark(
    blendLevel: 13,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
    scheme: FlexScheme.rosewood,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    swapLegacyOnMaterial3: true,
    useMaterial3: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  );

  static final ThemeData lightTheme = FlexThemeData.light(
    blendLevel: 7,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
    scheme: FlexScheme.rosewood,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    swapLegacyOnMaterial3: true,
    useMaterial3: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  );
}
