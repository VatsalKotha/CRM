// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:crm/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // section 1 - Login Header (image and title)
            Image(image: AssetImage(jLoginScreenImage)),
            Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.blue[900],
              ),
            ),

            // section 2 - Login Form (email id, password text field, forgot password and login button)
            LoginForm()
          ]),
        ),
      ),
    );
  }
}
