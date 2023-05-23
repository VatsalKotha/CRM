import 'package:crm/routes/routes.dart';
import 'package:crm/screens/auth/login/loginScreen.dart';
import 'package:crm/screens/home/home_page.dart';
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

      home: isLogin ? const HomePage() : const LoginScreen(),
    );
  }
}
