
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.formTitle,
    required this.formSubtitle,
    this.myFormWidget,

  });

  final Widget? myFormWidget;
  final String formTitle;
  final String formSubtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // form header
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formTitle,
                                style: GoogleFonts.roboto(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                formSubtitle,
                                style: GoogleFonts.poppins(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          // color: Colors.blueGrey,
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            iconSize: 35.0,
                            onPressed: () => Get.back(),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 30.0),

                  // form starts here !
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: myFormWidget ?? const Center(
                          child: Text("Provide me a Something !"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}