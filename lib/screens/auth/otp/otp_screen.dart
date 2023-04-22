import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // title
            Text(
              "OTP",
              style: GoogleFonts.montserrat(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),

            // just one more sub title
            const Text(
                "Verification",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // sub text or description text
            const Text(
              textAlign: TextAlign.center,
              jOtpScreenText,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 50.0),

            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              keyboardType: TextInputType.number,
              onSubmit: (inputOTP) {
                if (kDebugMode) {
                print("Entered OTP code : $inputOTP");
              }},
            ),

            const SizedBox(height: 50),

            // button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    Get.off(() => const HomePage());
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
          ],
        ),
      ),
    );
  }
}
