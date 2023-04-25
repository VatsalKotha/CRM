import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_dropdown.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:flutter/material.dart';

import '../../../utility/widget/form_widget.dart';
import '../../../utility/widget/radio_button_widget.dart';

enum LeadPriority {
  high,
  medium,
  low,
  normal,
}

class LeadForm extends StatefulWidget {
  const LeadForm({Key? key}) : super(key: key);

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {
  LeadPriority _selectedOption = LeadPriority.high;

  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
        child: FormWidget(
          formTitle: jLeadFormTitle,
          formSubtitle: jLeadFormSubtitle,
          myFormWidget: Form(
            child: Column(
              children: [
                FormTextBox(
                  hintText: "Product Launch",
                  prefixIcon: const Icon(Icons.people),
                  title: "Lead Name",
                  controller: myController1,
                ),

                Row(
                  children: const [
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Start Date",
                        controller: null,
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: Icon(Icons.date_range),
                        title: "End Date",
                        controller: null,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: const [
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Start Date",
                        controller: null,
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: FormDropdown(
                        title: "Priority",
                        optionValues: ["Normal","High","Medium","Low"],
                      ),
                    ),
                  ],
                ),

                RadioButtonWidget(
                  options: LeadPriority.values,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = (value as LeadPriority?)!;
                    });
                  },
                  textBuilder: (option) => option.toString().split('.')[1],
                  valueBuilder: (option) => option.toString(),
                ),

                const SizedBox(height: 40),

                const Button(
                  marginHorizontal: 30,
                  buttonText: "Save",
                  buttonBackgroundColor: Colors.green,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: null,
                  buttonTextSize: 20,
                ),

                const SizedBox(height: 20),

                const Button(
                  marginHorizontal: 30,
                  buttonText: "Cancel",
                  buttonBackgroundColor: Colors.blueAccent,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: null,
                  buttonTextSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
