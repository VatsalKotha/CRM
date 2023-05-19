import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormDropdown extends StatefulWidget {
  const FormDropdown({Key? key,
    this.title,
    this.prefixIcon,
    this.optionValues = const ["Option 1", "Option 2", "Option 3"],
  }) : super(key: key);

  final Icon? prefixIcon;
  final List<String> optionValues;
  final String? title;

  @override
  State<FormDropdown> createState() => _FormDropdownState();
}

class _FormDropdownState extends State<FormDropdown> {
  late String selectedValue = widget.optionValues[0];
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
        DropdownButtonFormField(
          items: widget.optionValues.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (newSelectedValue) {
            setState(() {
              selectedValue = newSelectedValue!;
            });
          },
          value: selectedValue,
          decoration: InputDecoration(
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
