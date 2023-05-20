
import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/validator.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_dropdown.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:crm/utility/widget/form_text_box_visibility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/widget/form_widget.dart';
import '../../../utility/widget/radio_button_widget.dart';

enum LeadPriority {
  High,
  Medium,
  Low,
  Normal,
}

class LeadForm extends StatefulWidget {
  const LeadForm({Key? key}) : super(key: key);

  @override
  State<LeadForm> createState() => _LeadFormState();
}

class _LeadFormState extends State<LeadForm> {

  GlobalKey<FormState> leadFormKey = GlobalKey<FormState>();

  LeadPriority _selectedOption = LeadPriority.High;

  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
        child: FormWidget(
          formTitle: jLeadFormTitle, // setting tittle
          formSubtitle: jLeadFormSubtitle, // setting sub text [below title]
          myFormWidget: Form(
            key: leadFormKey,
            child: Column(
              children: [
                // lead name
                FormTextBox(
                  hintText: "Product Launch",
                  prefixIcon: const Icon(Icons.people),
                  title: "Lead Name",
                  controller: myController1,
                ),

                // status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
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
                    const SizedBox(height: 20),
                  ],
                ),

                // closing date and priority
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
                        prefixIcon: Icon(Icons.flag),
                        title: "Priority",
                        optionValues: ["Normal","High","Medium","Low"],
                      ),
                    ),
                  ],
                ),

                // Client name
                Row(
                  children: const [
                    Expanded(
                      child: FormTextBox(
                        hintText: "First Name",
                        title: "Client Name",
                        controller: null,
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "Last Name",
                        controller: null,
                      ),
                    ),
                  ],
                ),

                // Phone number
                Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: FormDropdown(
                        title: "Label",
                        optionValues: ["Own","Work","Home","Main","Other"],
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      flex: 3,
                      child: FormTextBox(
                        hintText: "Phone Number",
                        title: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                        controller: null,
                      ),
                    ),
                  ],
                ),

                // Associated Sale's Person
                const FormDropdown(
                  title: "Sale's Person",
                  prefixIcon: Icon(Icons.person),
                  optionValues: ["Jash Parnar","Vatsal Kotha", "Unnati Patel"],
                ),

                // Company Name
                const FormTextBox(
                  title: "Company Name",
                  hintText: "ABC Company",
                  prefixIcon: Icon(Icons.apartment),
                ),

                // show more button  & optional fields
                FormTextBoxVisibility(
                  formTextBoxWidgets: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // email address
                      const FormTextBox(
                        title: "E-Mail Address",
                        hintText: "example@xyz.com",
                        prefixIcon: Icon(Icons.alternate_email),
                        optionalTextField: true,
                      ),

                      // Secondary client name
                      Row(
                        children: const [
                          Expanded(
                            child: FormTextBox(
                              hintText: "First Name",
                              title: "Client Name 2",
                              controller: null,
                            ),
                          ),
                          SizedBox(width: 25),
                          Expanded(
                            child: FormTextBox(
                              hintText: "Last Name",
                              optionalTextField: true,
                              controller: null,
                            ),
                          ),
                        ],
                      ),

                      // phone number
                      Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: FormDropdown(
                              title: "Label",
                              optionValues: ["Own","Work","Home","Main","Other"],
                            ),
                          ),
                          SizedBox(width: 25),
                          Expanded(
                            flex: 3,
                            child: FormTextBox(
                              hintText: "Phone Number",
                              title: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                              optionalTextField: true,
                              controller: null,
                            ),
                          ),
                        ],
                      ),

                      // address
                      const FormTextBox(
                        title: "Company Address",
                        hintText: "Location",
                        prefixIcon: Icon(Icons.location_on),
                        optionalTextField: true,
                      ),

                      // company website
                      const FormTextBox(
                        title: "Website",
                        hintText: "URL",
                        prefixIcon: Icon(Icons.link),
                        optionalTextField: true,
                      ),

                      // description
                      const FormTextBox(
                        title: "Description",
                        hintText: "Lead is about..",
                        prefixIcon: Icon(Icons.notes),
                        optionalTextField: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // save button
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

                // cancel button
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