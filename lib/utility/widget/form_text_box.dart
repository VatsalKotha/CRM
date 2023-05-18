import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormTextBox extends StatefulWidget {
  const FormTextBox({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.title,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String? title;
  final String hintText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator? validator;


  @override
  State<FormTextBox> createState() => _FormTextBoxState();
}

class _FormTextBoxState extends State<FormTextBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title text for the text box
        Text(
          widget.title ?? " ",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.grey[700],
          ),
        ),

        // spacing between the title and the text box
        const SizedBox(height: 8.0),

        // the text box
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            fillColor: Colors.grey[125],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
