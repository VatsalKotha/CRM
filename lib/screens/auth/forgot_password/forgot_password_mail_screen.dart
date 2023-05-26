
import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/auth/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_string.dart';

class ForgotPasswordMailScreen extends StatefulWidget {
  const ForgotPasswordMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordMailScreen> createState() => _ForgotPasswordMailScreenState();
}

class _ForgotPasswordMailScreenState extends State<ForgotPasswordMailScreen> {

  GlobalKey<FormState> forgotPasswordMailFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // section 1 - Login Header (image and title)
                const Image(image: AssetImage(jForgotPasswordImage)),

                // title
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.blue[900],
                  ),
                ),

                const SizedBox(height: 18.0,),

                // sub title or description text
                const Text(
                  jForgotPasswordMailText,
                  style: TextStyle(
                    fontSize: 18,
                ),
                ),

                const SizedBox(height: 45.0,),

                // enter email address text box
                Form(
                  key: forgotPasswordMailFormKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email id",
                      hintText: "Enter email address",
                    ),
                    validator: (value) {
                      final emailRegex = RegExp(r'^[\w-\\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (value!.isEmpty) {
                        return jEmailRequired;
                      } else if (!emailRegex.hasMatch(value)) {
                        return jLoginScreenEmailFieldValidatorText;
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 60.0,),

                // submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(forgotPasswordMailFormKey.currentState!.validate()){
                        Get.to(() => const OtpScreen());
                      }
                      else{
                        // your code when email address is valid but not found in database
                        // delete line this and write your code :)
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),

                // section 2 - Login Form (email id, password text field, forgot password and login button)

              ]),
        ),
      ),
    );
  }
}

