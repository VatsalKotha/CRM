// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class LeadModel {
  // ignore: non_constant_identifier_names
  final String? c_name;
  final String? c_first_name;
  final String? c_last_name;
  final String? closing_date;
  final String? lead_name;
  final String? phone_no;
  final String? priority;
  final String? sales_person;

  const LeadModel(
      {this.c_name,
      this.c_first_name,
      this.c_last_name,
      this.closing_date,
      this.lead_name,
      this.phone_no,
      this.priority,
      this.sales_person});

  toJson() {
    return {
      "Company Name": c_name,
      "Client First Name": c_first_name,
      "Client Last Name": c_last_name,
      "Closing Date ": closing_date,
      "Lead Name": lead_name,
      "Contact Number": phone_no,
      "Priority": priority,
      "Sales Person": sales_person
    };
  }

  factory LeadModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data();
    return LeadModel(
      c_name: data!["Company Name"],
      c_first_name: data["Client First Name"],
      c_last_name: data["Client Last Name"],
      closing_date: data["Closing Date"],
      lead_name: data["Lead Name"],
      phone_no: data["Phone Number"],
      sales_person: data["Sales Person"],
    );
  }
}
