import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/admin/admin_page.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  var emailIdText = TextEditingController();
  var passwordText = TextEditingController();
  bool obscureText = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // Toast message
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: "Welcome!",
          message: "Login successful",
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      Get.off(() => const HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not found"),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid email or password"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred"),
        ),
      );
    }
  }

  bool isAdmin(String email) {
    // Add your admin email check logic here
    return email == 'admin@gmail.com' || email == 'admin123@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email id
            TextFormField(
              controller: emailIdText,
              decoration: const InputDecoration(
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
            const SizedBox(height: 20),

            // Password
            TextFormField(
              controller: passwordText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                labelText: "Password",
                hintText: "Enter password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
              obscureText: obscureText,
              obscuringCharacter: "*",
              validator: (value) {
                if (value!.isEmpty) {
                  return jPasswordRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 5.0),

            // Forgot password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(30.0),
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
                              Get.to(() => const ForgotPasswordMailScreen());
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          // SMS Verification
                          ForgotPasswordOptionWidget(
                            btnIcon: Icons.sms_outlined,
                            title: "Phone",
                            subtitle: jResetViaSMS,
                            onTap: () {
                              Get.to(() => const ForgotPasswordSMSScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (loginFormKey.currentState!.validate()) {
                    String inputEmailId = emailIdText.text.toString();
                    String inputPassword = passwordText.text;
                    if (kDebugMode) {
                      print(
                          "Entered E-Mail Id : $inputEmailId \n Entered Password : $inputPassword");
                    }

                    if (isAdmin(inputEmailId) && inputPassword == 'admin') {
                      // Admin login successful
                      print('Admin logged in successfully');
                      Get.off(() => const AdminPage());
                    } else {
                      await loginUser(inputEmailId, inputPassword);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
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
      ),
    );
  }
}
