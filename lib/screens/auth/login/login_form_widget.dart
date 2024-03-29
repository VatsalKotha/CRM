// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/admin/admin_page.dart';
import 'package:crm/screens/auth/database/Authentication.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/validator.dart';
import '../forgot_password/forgot_password_mail_screen.dart';
import '../forgot_password/forgot_password_option_widget.dart';
import '../forgot_password/forgot_password_sms_screen.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var email_idText = TextEditingController();
  var passText = TextEditingController();
  bool jObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // email id
              TextFormField(
                controller: email_idText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email id",
                  hintText: "Enter email address",
                ),
                enableIMEPersonalizedLearning: true,
                enableSuggestions: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return jEmailRequired;
                  } else if (!RegExp(r'^[\w-\\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return jLoginScreenEmailFieldValidatorText;
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // password
              TextFormField(
                controller: passText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  hintText: "Enter password",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          jObscureText = !jObscureText;
                        });
                      },
                      child: Icon(jObscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined)),
                ),
                obscureText: jObscureText,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value!.isEmpty) {
                    return jPasswordRequired;
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 5.0),

              // forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Container(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(jForgotPasswordPopUpTitle,
                                style: Theme.of(context).textTheme.headline5),
                            Text(jForgotPasswordPopUpSubtitle,
                                style: Theme.of(context).textTheme.bodyText1),
                            const SizedBox(
                              height: 30.0,
                            ),
                            // Mail Verification
                            ForgotPasswordOptionWidget(
                              btnIcon: Icons.email_outlined,
                              title: "E-Mail",
                              subtitle: jResetViaMail,
                              onTap: () {
                                Get.to(() => ForgotPasswordMailScreen());
                              },
                            ),

                            // SMS Verification
                            SizedBox(
                              height: 20.0,
                            ),
                            ForgotPasswordOptionWidget(
                              btnIcon: Icons.sms_outlined,
                              title: "Phone",
                              subtitle: jResetViaSMS,
                              onTap: () {
                                Get.to(() => ForgotPasswordSMSScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }, // On Pressed Function
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10.0),

              // login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // checking validation if success then will navigate to HomePage()
                    // else will remain here at LoginScreen()
                    if (loginFormKey.currentState!.validate()) {
                      String inputEmailId = email_idText.text.toString();
                      String inputPassword = passText.text;
                      if (kDebugMode) {
                        print(
                            "Entered E-Mail Id : $inputEmailId \n Entered Password : $inputPassword");
                      }

                      // toast message
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: "Welcome!",
                          message:
                              "Login success, credentials printed on the log screen",
                          contentType: ContentType.success,
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);

                      Get.off(() => HomePage());
                    } else {
                      // your code when credentials are valid but not found in database
                      // delete line this and write your code :)
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
