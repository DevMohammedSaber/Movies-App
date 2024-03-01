import 'package:flutter/material.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/text_theme.dart';

import '../constants/colors.dart';

class ZAppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'GloryTSI',
    disabledColor: ZColors.grey,
    brightness: Brightness.light,
    primaryColor: ZColors.primary,
    textTheme: ZTextTheme.lightTextTheme,
    scaffoldBackgroundColor: ZColors.light,
    appBarTheme: ZAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'GloryTSI',
    disabledColor: ZColors.grey,
    brightness: Brightness.dark,
    primaryColor: ZColors.primary,
    textTheme: ZTextTheme.darkTextTheme,
    scaffoldBackgroundColor: ZColors.dark,
    appBarTheme: ZAppBarTheme.darkAppBarTheme,
  );
}
