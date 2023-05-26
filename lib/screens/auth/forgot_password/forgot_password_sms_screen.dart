import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/image_string.dart';
import '../../../constants/text_string.dart';
import '../otp/otp_screen.dart';

class ForgotPasswordSMSScreen extends StatefulWidget {
  const ForgotPasswordSMSScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordSMSScreen> createState() => _ForgotPasswordSMSScreenState();
}

class _ForgotPasswordSMSScreenState extends State<ForgotPasswordSMSScreen> {

  GlobalKey<FormState> forgotPasswordSMSFormKey = GlobalKey<FormState>();

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

                const SizedBox(height: 18.0),

                // sub title or description
                const Text(
                  jForgotPasswordSMSText,
                  style: TextStyle(

                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 45.0),

                // phone number text box
                Form(
                  key: forgotPasswordSMSFormKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: "Phone No",
                      hintText: "Enter mobile number",
                      helperText: jForgotPasswordSMSHelperText,
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return jPhoneNumberRequired;
                      } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                        return jForgotPasswordPhoneFieldValidatorText;
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
                      if(forgotPasswordSMSFormKey.currentState!.validate()){
                        Get.to(() => const OtpScreen());
                      }
                      else{
                        // your code when phone number is valid but not found in database
                        // delete line this and write your code :)
                      }
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

              ]),
        ),
      ),
    );
  }
}

