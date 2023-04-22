import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crm/screens/auth/database/AddLead.dart';
import '../../../utility/widget/form_widget.dart';
import '../../../utility/widget/radio_button_widget.dart';
import 'lead_page.dart';

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
                  hintText: "Lead Name",
                  prefixIcon: const Icon(Icons.people),
                  title: "Lead Name",
                  controller: name,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Start Date",
                        controller: startDate,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: Icon(Icons.date_range),
                        title: "End Date",
                        controller: closing,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "First Name",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Client Name",
                        controller: cfname,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Last Name",
                        controller: claname,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "Label",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Label",
                        controller: label,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "Phone Number",
                        prefixIcon: Icon(Icons.date_range),
                        title: "Phone Number",
                        controller: phoneNo,
                      ),
                    ),
                  ],
                ),
                FormTextBox(
                  hintText: "John Doe",
                  prefixIcon: const Icon(Icons.people),
                  title: "Assoicated Sales Person",
                  controller: salesPerson,
                ),
                FormTextBox(
                  hintText: "Abc Company",
                  prefixIcon: const Icon(Icons.people),
                  title: "Company Name",
                  controller: cname,
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
                Button(
                  marginHorizontal: 30,
                  buttonText: "Save",
                  buttonBackgroundColor: Colors.green,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: () {
                    AddLead().dataToSave();

                    Get.to(() => const LeadPage());
                  },
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
