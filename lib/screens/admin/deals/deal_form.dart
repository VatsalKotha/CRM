import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:crm/utility/widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:crm/screens/auth/database/AddDeals.dart';

class DealForm extends StatefulWidget {
  const DealForm({super.key});

  @override
  State<DealForm> createState() => _DealFormState();
}

class _DealFormState extends State<DealForm> {
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
                  hintText: "Equipment",
                  prefixIcon: const Icon(Icons.people),
                  title: "Equipment",
                  controller: equipment,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: const Icon(Icons.date_range),
                        title: " Closing Date",
                        controller: closing,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "1/2/3",
                        prefixIcon: const Icon(Icons.date_range),
                        title: "Priority",
                        controller: priority,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "John Doe",
                        prefixIcon: const Icon(Icons.people),
                        title: "Client Name",
                        controller: cfname,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "Last Name",
                        prefixIcon: const Icon(Icons.email),
                        title: "",
                        controller: clname,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FormTextBox(
                        hintText: "Label",
                        prefixIcon: const Icon(Icons.label),
                        title: "Label",
                        controller: label,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      flex: 3,
                      child: FormTextBox(
                        hintText: "Phone Number",
                        prefixIcon: const Icon(Icons.phone),
                        title: "Phone Number",
                        controller: phoneNo,
                      ),
                    ),
                  ],
                ),
                FormTextBox(
                  hintText: "Company Name",
                  prefixIcon: const Icon(Icons.people),
                  title: "Company Name",
                  controller: cname,
                ),
                const SizedBox(height: 40),
                Button(
                  marginHorizontal: 30,
                  buttonText: "Save",
                  buttonBackgroundColor: Colors.green,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: () {
                    AddDeal().dataToSave();
                    // clearController();
                    Get.to(() => const HomePage());
                    // Navigator.push(context, const LeadPage() as Route<Object?>);
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
