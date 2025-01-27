import 'package:flutter/material.dart';

class Themes {
  BuildContext context;
  Themes({required this.context});

  static Themes of(BuildContext context) {
    return Themes(context: context);
  }

  ThemeData lightTheme() {
    return ThemeData.light();
  }

  ThemeData darkTheme() {
    return ThemeData.dark();
  }
}
