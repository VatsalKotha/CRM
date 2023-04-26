import 'package:crm/routes/routes.dart';
import 'package:crm/screens/auth/login/loginScreen.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:crm/screens/home/lead/lead_form.dart';
import 'package:crm/screens/home/lead/lead_page.dart';
import 'package:crm/screens/home/report/meeting_page.dart';
import 'package:crm/screens/home/report/report_page.dart';
import 'package:crm/utility/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
      themeMode: ThemeMode.system,

      // disabling the debug banner from top right conner
      debugShowCheckedModeBanner: false,

      // Use a try/catch block to handle errors in case the route is not defined.
      initialRoute: (() {
        try {
          return Routes.getLoginScreenRoute();
        } catch (e) {
          return '/';
        }
      })(),

      // Use a ternary operator to conditionally display the login or home screen.
      // home: isLogin ? const HomePage() : const LoginScreen(),
      home: isLogin ? const HomePage() : const LoginScreen(),
    );
  }
}
