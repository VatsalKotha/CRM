
// ignore_for_file: prefer_const_constructors

import 'package:crm/routes/routes.dart';
import 'package:crm/screens/auth/login/loginScreen.dart';
import 'package:crm/utility/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      // setting the theme
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // disabling the debug banner from top right conner
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.getLoginScreenRoute(),

       home: LoginScreen(),
      // home: LeadDetailScreen(leadName: "Jash Parmar"),
    );
  }
}