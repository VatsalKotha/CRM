import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController cname = TextEditingController();
final TextEditingController cemail = TextEditingController();
final TextEditingController date = TextEditingController();
final TextEditingController desc = TextEditingController();
final TextEditingController label = TextEditingController();
final TextEditingController phoneNo = TextEditingController();
final TextEditingController rating = TextEditingController();
final TextEditingController title = TextEditingController();

class AddFeedback {
  dataToSave() {
    Map<String, String> dataToSave = {
      'Client Name': cname.text,
      'Client Email ': cemail.text,
      'Date': date.text,
      "Description": desc.text,
      "Rating": rating.text,
      "Label": label.text,
      "Title": title.text,
      "Phone Number": phoneNo.text
    };

    FirebaseFirestore.instance.collection("Feedback").add(dataToSave);
  }
}
