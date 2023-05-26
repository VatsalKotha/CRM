import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:crm/utility/widget/lead_card_widget.dart';
import 'package:flutter/material.dart';

class LeadPage extends StatefulWidget {
  const LeadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarLeadPageTitle),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterLeads,
              decoration: const InputDecoration(
                labelText: 'Search Leads',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: sortLeads,
            child: Text(isAscending ? 'Sort A-Z' : 'Sort Z-A'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLeadList.length,
              itemBuilder: (context, index) {
                return LeadCardWidget(
                  onPressed: () {
                    final selectedLead = filteredLeadList[index];
                    Get.to(() => LeadDetailScreen(
                          leadName: selectedLead["Lead Name"],
                          leadClientName: selectedLead["Client First Name"],
                          leadClientPhnNo1: selectedLead["Phone Number"],
                          leadClosingDate: selectedLead["Closing Date"],
                          leadCompanyName: selectedLead["Company Name"],
                          leadCreatedBy: selectedLead["Label"],
                          leadDateCreated: selectedLead["Client Last Name"],
                          leadModifiedBy: selectedLead["Start Date"],
                          leadPriority: selectedLead["Priority"],
                          leadSalesPersonName: selectedLead["Sales Person"],
                          leadStatus: selectedLead["Status"],
                          leadClientLastName: selectedLead["Client Last Name"],
                          leadLabel: selectedLead["Label"],
                        ));
                  },
                  leadName: filteredLeadList[index]["Lead Name"],
                  leadClosingDate: filteredLeadList[index]["Closing Date"],
                  leadCompanyName: filteredLeadList[index]["Company Name"],
                  leadPersonName: filteredLeadList[index]["Client First Name"],
                  leadPriorityInt: filteredLeadList[index]["Priority"],
                  phoneNumber: filteredLeadList[index]["Phone Number"],
                  salesPersonName: filteredLeadList[index]["Sales Person"],
                  leadStatus: filteredLeadList[index]["Status"],
                );
              },
            ),
          ),
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
