import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/auth/database/event_firstore.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:crm/utility/widget/button.dart';
import 'package:crm/utility/widget/form_text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../utility/widget/form_widget.dart';
import 'package:crm/screens/auth/database/AddMeetings.dart';
import 'package:crm/screens/home/report/meeting_page.dart';
import 'package:intl/intl.dart';

class MeetingForm extends StatefulWidget {
  const MeetingForm({Key? key}) : super(key: key);

  @override
  State<MeetingForm> createState() => _MeetingFormState();
}

class _MeetingFormState extends State<MeetingForm> {
  final formkey = GlobalKey<FormBuilderState>();
  // final DateTime selectedDay;
  Map<String, List> selectedEvents = {};

  // LeadPriority _selectedOption = LeadPriority.high;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
        child: FormWidget(
          formTitle: VMeetingFormTitle,
          formSubtitle: VMeetingFormSubtitle,
          myFormWidget: Form(
            key: formkey,
            child: Column(
              children: [
                FormTextBox(
                  hintText: "Title",
                  prefixIcon: const Icon(Icons.title),
                  title: "Title",
                  controller: title,
                ),
                const ListTile(
                  title: Text("Date(YYYY-MM-DD)"),
                  // subtitle: Text("$[""]"),
                ),
                FormTextBox(
                  hintText: "YYYY-MM-DD",
                  prefixIcon: const Icon(Icons.title),
                  title: "Date",
                  controller: date,
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: FormTextBox(
                //         hintText: "12 April 2023",
                //         prefixIcon: const Icon(Icons.date_range),
                //         title: "Date",
                //         controller: date,
                //       ),
                //     ),
                const SizedBox(width: 25),
                //     Expanded(
                //       child: FormTextBox(
                //         hintText: "10.00",
                //         prefixIcon: const Icon(Icons.timelapse_rounded),
                //         title: "Time",
                //         controller: time,
                //       ),
                //     ),
                //   ],
                // ),

                Row(
                  children: [
                    Expanded(
                      child: FormTextBox(
                        hintText: "First Name",
                        prefixIcon: const Icon(Icons.people),
                        title: "Client Name",
                        controller: cfname,
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FormTextBox(
                        hintText: "Last Name",
                        prefixIcon: const Icon(Icons.people),
                        title: "Last Name",
                        controller: claname,
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
                  hintText: "",
                  prefixIcon: const Icon(Icons.description),
                  title: "Description",
                  controller: desc,
                ),
                // RadioButtonWidget(
                //   options: LeadPriority.values,
                //   groupValue: _selectedOption,
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedOption = (value as LeadPriority?)!;
                //     });
                //   },
                //   textBuilder: (option) => option.toString().split('.')[1],
                //   valueBuilder: (option) => option.toString(),
                // ),
                const SizedBox(height: 40),
                Button(
                  marginHorizontal: 30,
                  buttonText: "Save",
                  buttonBackgroundColor: Colors.green,
                  buttonTextColor: Colors.white,
                  buttonHeight: 50,
                  onPressed: () async {
                    AddMeetings().dataToSave();
                    // bool validated = formkey.currentState!.validate();
                    // final data =
                    //     Map<String, dynamic>.from(formkey.currentState!.value);
                    // data["date"] =
                    //     (data["date"] as DateTime).millisecondsSinceEpoch;
                    // print(data);
                    // await eventDBS.create(data);
                    Get.to(() => const HomePage());
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
