// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController equipment = TextEditingController();
final TextEditingController closing = TextEditingController();
final TextEditingController priority = TextEditingController();
final TextEditingController cfname = TextEditingController();
final TextEditingController clname = TextEditingController();
final TextEditingController phoneNo = TextEditingController();
final TextEditingController label = TextEditingController();
final TextEditingController cname = TextEditingController();

class AddDeal {
  dataToSave() {
    Map<String, String> dataToSave = {
      'Equipment': equipment.text,
      'Closing date ': closing.text,
      'Priority': priority.text,
      "Client First Name": cfname.text,
      "Client Last Name": clname.text,
      "Label": label.text,
      "Company Name": cname.text,
      "Phone Number": phoneNo.text
    };

    FirebaseFirestore.instance.collection("Deal").add(dataToSave);
  }
}
