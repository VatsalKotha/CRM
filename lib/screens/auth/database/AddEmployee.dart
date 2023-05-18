import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController id = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController fname = TextEditingController();
final TextEditingController lname = TextEditingController();
final TextEditingController phoneNo = TextEditingController();
final TextEditingController label = TextEditingController();
final TextEditingController dept = TextEditingController();
final TextEditingController jobTitle = TextEditingController();

class AddEmpoyee {
  dataToSave() {
    Map<String, String> dataToSave = {
      'ID': id.text,
      'Email ': email.text,
      "First Name": fname.text,
      "Last Name": lname.text,
      "Label": label.text,
      "Department": dept.text,
      "Phone Number": phoneNo.text,
      "Job Title": jobTitle.text
    };

    FirebaseFirestore.instance.collection("Employee").add(dataToSave);
  }
}
