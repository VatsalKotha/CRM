// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController cname = TextEditingController();
final TextEditingController cfname = TextEditingController();
final TextEditingController claname = TextEditingController();
final TextEditingController closing = TextEditingController();
final TextEditingController label = TextEditingController();
final TextEditingController name = TextEditingController();
final TextEditingController startDate = TextEditingController();
final TextEditingController phoneNo = TextEditingController();
final TextEditingController salesPerson = TextEditingController();
final TextEditingController priority = TextEditingController();
final TextEditingController status = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController address = TextEditingController();
final TextEditingController desc = TextEditingController();
final TextEditingController web = TextEditingController();

class AddLead {
  dataToSave() {
    Map<String, String> dataToSave = {
      'Company Name': cname.text,
      'Client First Name': cfname.text,
      'Client Last Name': claname.text,
      "Start Date": startDate.text,
      "Closing Date": closing.text,
      "Label": label.text,
      "Phone Number": phoneNo.text,
      "Sales Person": salesPerson.text,
      "Lead Name": name.text,
      "Priority": priority.text,
      "Status": status.text,
      "Email": email.text,
      "Address": address.text,
      "Description": desc.text,
      "Website": web.text
    };

    FirebaseFirestore.instance.collection("Lead").add(dataToSave);
  }
}
