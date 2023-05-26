import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController name = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController cname = TextEditingController();
final TextEditingController label = TextEditingController();
final TextEditingController phoneNo = TextEditingController();

class AddContact {
  dataToSave() {
    Map<String, String> dataToSave = {
      'Name': name.text,
      'E-mail ': email.text,
      "Label": label.text,
      "Company Name": cname.text,
      "Phone Number": phoneNo.text
    };

    FirebaseFirestore.instance.collection("Contacts").add(dataToSave);
  }
}
