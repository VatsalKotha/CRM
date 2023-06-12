import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:crm/utility/widget/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../home_page.dart';
import 'feedback_page.dart';
import 'package:crm/screens/auth/database/AddFeedback.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
        child: FormWidget(
          formTitle: vFeedFormTitle,
          formSubtitle: vFeedFormSubTitle,
          myFormWidget: Form(
            child: Column(
              children: [
                FormTextBox(
                  hintText: "Feedback Title",
                  prefixIcon: const Icon(Icons.people),
                  title: "Title",
                  controller: title,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "12 April 2023",
                        prefixIcon: const Icon(Icons.date_range),
                        title: " Date",
                        controller: date,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "1/2/3/4/5",
                        prefixIcon: const Icon(Icons.date_range),
                        title: "Rating",
                        controller: rating,
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
                        title: "Name",
                        controller: cname,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "abcd@gmail.com",
                        prefixIcon: const Icon(Icons.email),
                        title: "Email",
                        controller: cemail,
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
                  hintText: "Description",
                  prefixIcon: const Icon(Icons.people),
                  title: "Description",
                  controller: desc,
                ),
                const SizedBox(height: 40),
                Button(
                  marginHorizontal: 30,
                  buttonText: "Save",
                  buttonBackgroundColor: Colors.green,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: () {
                    AddFeedback().dataToSave();
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
