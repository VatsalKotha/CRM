import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/admin/contacts/contact_page.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:crm/utility/widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crm/screens/auth/database/AddContact.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
        child: FormWidget(
          formTitle: vConFormTitle,
          formSubtitle: vConFormSuTitle,
          myFormWidget: Form(
            child: Column(
              children: [
                FormTextBox(
                  hintText: "Name",
                  prefixIcon: const Icon(Icons.people),
                  title: "John Doe",
                  controller: name,
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
                FormTextBox(
                  hintText: "0 - 7",
                  prefixIcon: const Icon(Icons.people),
                  title: "Color",
                  controller: color,
                ),
                const SizedBox(height: 40),
                Button(
                  marginHorizontal: 30,
                  buttonText: "Save",
                  buttonBackgroundColor: Colors.green,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: () {
                    AddContact().dataToSave();
                    name.clear();
                    cname.clear();
                    email.clear();
                    label.clear();
                    phoneNo.clear();
                    color.clear();
                    // clearController();
                    Get.to(() => const ContactPage());
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
