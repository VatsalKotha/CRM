import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:crm/screens/home/lead/lead_form.dart';
import 'package:get/get.dart';
import 'package:crm/screens/home/lead/lead_detail_screen.dart';
import 'package:crm/screens/home/lead/lead_page.dart';

class ActionEvent {
  static VoidCallback? phoneEventHandler() {
    if (kDebugMode) {
      print("Action Event : Phone action button was pressed");
    }
    return null;
  }

  static VoidCallback? emailEventHandler() {
    if (kDebugMode) {
      print("Action Event : Email action button was pressed");
    }
    return null;
  }

  static void editEventHandler(
      {required String leadName,
      required String leadStatus,
      required String leadDateCreated,
      required String leadClosingDate,
      required String leadClientName,
      required String leadClientPhnNo1,
      required String leadSalesPersonName,
      required String leadCompanyName,
      required String leadPriority,
      required String leadLastName,
      required String leadLabel}) {
    final leadFormData = LeadFormData();
    leadFormData.leadName = leadName;
    leadFormData.leadStatus = leadStatus;
    leadFormData.leadStartDate = leadDateCreated;
    leadFormData.leadClosing = leadClosingDate;
    leadFormData.clientFirstName = leadClientName;
    leadFormData.clientLastName = leadLastName;
    leadFormData.leadLabel = leadLabel;

    leadFormData.leadPhoneNo = leadClientPhnNo1;
    leadFormData.associatedSalesPerson = leadSalesPersonName;
    leadFormData.companyName = leadCompanyName;
    leadFormData.leadPriority = leadPriority;

    Get.to(() => LeadForm(
          leadFormData: leadFormData,
          isEditMode: true,
        ));
  }

  static Future<void> deleteEventHandler(String leadId) async {
    if (kDebugMode) {
      print(
          "Action Event: Delete action button was pressed for leadId: $leadId");
    }
    try {
      await FirebaseFirestore.instance.collection("Lead").doc(leadId).delete();
      Get.offAll(
          () => LeadPage()); // Navigate back to the lead page after deletion
    } catch (e) {
      print("Error deleting lead: $e");
// Show an error message to the user if deletion fails
      Get.snackbar("Error", "Failed to delete the lead. Please try again.");
    }
  }
}
