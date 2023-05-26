
import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:crm/utility/widget/lead_card_widget.dart';
import 'package:flutter/material.dart';

class LeadPage extends StatelessWidget {
  const LeadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarLeadPageTitle),
      body: ListView(
        children: const [
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "12 April 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community. Meeting setup for the audit community.Meeting setup for the audit community.",
              leadPriority: "High",
              leadStatus: "New"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriority: "High",
              leadStatus: "Qualified"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriority: "High",
              leadStatus: "Won"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriority: "High",
              leadStatus: "Lost"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriority: "High",
              leadStatus: "Won"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "12 April 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community. Meeting setup for the audit community.Meeting setup for the audit community.",
              leadPriority: "High",
              leadStatus: "New"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "12 April 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community. Meeting setup for the audit community.Meeting setup for the audit community.",
              leadPriority: "High",
              leadStatus: "New"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriority: "High",
              leadStatus: "Won"),
          LeadCardWidget(
              leadName: "Product Enquiry",
              leadClosingDate: "05 May 2023",
              leadCompanyName: "ABC Company",
              leadPersonName: "Ramesh Shah",
              leadDescription: "Meeting setup for the audit community",
              leadPriority: "High",
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

