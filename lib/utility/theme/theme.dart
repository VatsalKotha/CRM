import 'package:crm/utility/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JAppTheme {
  
   // we don't want user to access the theme using an instance of the class, thus private :)
  JAppTheme._();

   // color selection for light theme 
  static ThemeData lightTheme = ThemeData(
    textTheme: JTextTheme.lightTextTheme,
    brightness: Brightness.light, 
    primarySwatch: Colors.orange,
    focusColor: Colors.blue,
    );

   // color selection for dark theme  
  static ThemeData darkTheme = ThemeData(
    textTheme: JTextTheme.darkTextTheme,
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    focusColor: Colors.blue,
  );

}