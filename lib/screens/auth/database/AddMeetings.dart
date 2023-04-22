import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController title = TextEditingController();
final TextEditingController cfname = TextEditingController();
final TextEditingController claname = TextEditingController();
final TextEditingController time = TextEditingController();
final TextEditingController label = TextEditingController();
final TextEditingController name = TextEditingController();
final TextEditingController date = TextEditingController();
final TextEditingController desc = TextEditingController();
final TextEditingController salesPerson = TextEditingController();

class AddMeetings {
  dataToSave() {
    Map<String, String> dataToSave = {
      'Title': title.text,
      'Client First Name': cfname.text,
      'Client Last Name': claname.text,
      "Date": date.text,
      "Time": time.text,
      "Sales Person": salesPerson.text,
      "Description": desc.text,
    };
    FirebaseFirestore.instance.collection("Meetings").add(dataToSave);
  }
}
