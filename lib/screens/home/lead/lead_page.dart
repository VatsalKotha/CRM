import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/screens/auth/database/lead_repo.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:crm/utility/widget/lead_card_widget.dart';
import 'package:flutter/material.dart';

class LeadPage extends StatefulWidget {
  const LeadPage({Key? key}) : super(key: key);

  @override
  State<LeadPage> createState() => _LeadPageState();
}

class _LeadPageState extends State<LeadPage> {
  List leadList = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchDatabaseList();
  // }

  // fetchDatabaseList() async {
  //   dynamic result = await LeadRepo().getLeadList();

  //   if (result == null) {
  //     print("Unable to retreive");
  //   } else {
  //     setState(() {
  //       leadList = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarLeadPageTitle),
      body: ListView(
        children: [
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "12 April 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription:
                  "Meeting setup for the audit community. Meeting setup for the audit community.Meeting setup for the audit community.",
              leadPriorityInt: 3,
              leadStatus: "New"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriorityInt: 2,
              leadStatus: "Qualified"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriorityInt: 1,
              leadStatus: "Won"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriorityInt: 0,
              leadStatus: "Lost"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriorityInt: 1,
              leadStatus: "Won"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "12 April 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription:
                  "Meeting setup for the audit community. Meeting setup for the audit community.Meeting setup for the audit community.",
              leadPriorityInt: 3,
              leadStatus: "New"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "12 April 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription:
                  "Meeting setup for the audit community. Meeting setup for the audit community.Meeting setup for the audit community.",
              leadPriorityInt: 3,
              leadStatus: "New"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriorityInt: 1,
              leadStatus: "Won"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriorityInt: 0,
              leadStatus: "Lost"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () => OnPressAction.goToLeadForm(),
      ),
    );
  }
}
