// ignore_for_file: prefer_const_constructors

import 'package:crm/routes/routes.dart';
import 'package:crm/screens/admin/contacts/contact_page.dart';
import 'package:crm/utility/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLogin = false;
  var auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    auth.authStateChanges().listen(checkifLogin);
  }

  // Use async/await instead of listen() to simplify the code
  // and avoid calling setState() on an unmounted widget.
  // Also, initialize the value of isLogin to false.
  void checkifLogin(User? user) async {
    if (user != null && mounted) {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // setting the theme
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      themeMode: ThemeMode.light,

      // disabling the debug banner from top right conner
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.getLoginScreenRoute(),

      // Use a ternary operator to conditionally display the login or home screen.
      // home: isLogin ? const HomePage() : const LoginScreen(),
      home: isLogin ? const HomePage() : const LoginScreen(),
    );
  }
}
