import 'package:crm/screens/auth/database/lead_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeadRepo extends GetxController {
  static LeadRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createLead(LeadModel lead) async {
    await _db.collection("Lead").add(lead.toJson()).whenComplete(() =>
        Get.snackbar("Success", "Lead Created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green));
  }
}
