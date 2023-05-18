import 'package:crm/screens/home/lead/lead_detail_screen.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/text_string.dart';
import '../../../controllers/on_press_action.dart';
import '../../../utility/widget/lead_card_widget.dart';
import '../../auth/database/fetch_leads.dart';

class LeadPage extends StatefulWidget {
  const LeadPage({Key? key}) : super(key: key);

  @override
  State<LeadPage> createState() => _LeadPageState();
}

List<Map<String, dynamic>> leadList = [];

class _LeadPageState extends State<LeadPage> {
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await FetchLeads().getLeadList();

    if (result == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        leadList = (result as List<dynamic>).cast<Map<String, dynamic>>();
        // leadList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarLeadPageTitle),
      body: ListView.builder(
          itemCount: leadList.length,
          itemBuilder: (context, index) {
            return LeadCardWidget(
                onPressed: () {
                  final selectedLead = leadList[index];
                  setState(() {
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
                        ));
                  });
                },
                leadName: leadList[index]["Lead Name"],
                leadClosingDate: leadList[index]["Closing Date"],
                leadCompanyName: leadList[index]["Company Name"],
                leadPersonName: leadList[index]["Client First Name"],
                leadPriorityInt: leadList[index]["Priority"],
                phoneNumber: leadList[index]["Phone Number"],
                salesPersonName: leadList[index]["Sales Person"],
                leadStatus: leadList[index]["Status"]);
          }),
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
