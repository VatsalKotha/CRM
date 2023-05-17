import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_string.dart';
import '../../screens/auth/database/fetch_leads.dart';
import '../../screens/home/lead/lead_detail_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LeadCardWidget extends StatefulWidget {
  LeadCardWidget(
      {super.key,
      required this.leadName,
      required this.leadClosingDate,
      required this.leadCompanyName,
      required this.leadPersonName,
      required this.leadPriorityInt,
      required this.leadStatus,
      required this.phoneNumber,
      required this.salesPersonName});

  String? leadPriorityInt;
  String? leadName;
  String? leadClosingDate;
  String? leadCompanyName;
  String? leadPersonName;
  String? leadStatus;
  String? phoneNumber;
  String? salesPersonName;

  @override
  State<LeadCardWidget> createState() => _LeadCardWidgetState();
}

class _LeadCardWidgetState extends State<LeadCardWidget> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;

  final CollectionReference lead =
      FirebaseFirestore.instance.collection("Lead");

  List leadList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrl = "";

    getImageUrl();
  }

  Future<void> getImageUrl() async {
    final ref = storage.ref().child("${widget.salesPersonName}.png");
    // final ref = storage.ref().child("jash.png");
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  String? leadDescription;

  @override
  Widget build(BuildContext context) {
    Color leadPriorityColor, leadStatusColor;

    if (widget.leadPriorityInt == "3") {
      leadPriorityColor = Colors.redAccent;
    } else if (widget.leadPriorityInt == "2") {
      leadPriorityColor = Colors.orange;
    } else if (widget.leadPriorityInt == "1") {
      leadPriorityColor = Colors.yellow;
    } else {
      leadPriorityColor = Colors.grey;
    }

    if (widget.leadStatus == "New") {
      leadStatusColor = Colors.blueAccent;
    } else if (widget.leadStatus == "Won") {
      leadStatusColor = Colors.green;
    } else if (widget.leadStatus == "Lost") {
      leadStatusColor = Colors.red;
    } else {
      leadStatusColor = Colors.purple;
    }

    return SizedBox(
        height: 140.0,
        child: GestureDetector(
          // onTap: () async {
          //   final documentSnapshot =
          //       await FirebaseFirestore.instance.collection("Lead").doc().get();

          //   // Stream<QuerySnapshot> snapshots = leadCollection.snapshots();

          //   // snapshots.listen((QuerySnapshot snapshot) {
          //   //   List<DocumentSnapshot> document = snapshot.docs;
          //   //   for (DocumentSnapshot documentSnapshot in document) {
          //   //     String documentId;
          //   //   }
          //   // });

          //   if (documentSnapshot.exists) {
          //     final data = documentSnapshot.data();
          //     if (data != null) {
          //       setState(() {
          //         Get.to(() => LeadDetailScreen(
          //               leadName: data["Lead Name"],
          //               leadClientName: data["Client First Name"],
          //               leadClientPhnNo1: data["Phone Number"],
          //               leadClosingDate: data["Closing Date"],
          //               leadCompanyName: data["Company Name"],
          //               leadCreatedBy: data["Label"],
          //               leadDateCreated: data["Client Last Name"],
          //               leadModifiedBy: data["Start Date"],
          //               leadPriority: data["Priority"],
          //               leadSalesPersonName: data["Sales Person"],
          //               leadStatus: data["Status"],
          //             ));
          //       });
          //     }
          //   }
          // },
          child: Card(
            elevation: 3.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  color: leadPriorityColor,
                  width: 6.0,
                ),

                // Lead Details : lead name, closing date, company name, person name, description
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5.0),
                        // Lead title
                        Text(
                          widget.leadName!,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3.0),

                        // closing date
                        Text(
                          "Closing date : ${widget.leadClosingDate}",
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        // Company Name
                        Text(
                          widget.leadCompanyName!,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        // Person Name
                        Text(
                          widget.leadPersonName!,
                          style: const TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // Phone Number
                        Text(
                          widget.phoneNumber!,
                          style: const TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.salesPersonName!,
                          style: const TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 18.0),
                //Lead Status + Associated Sale's Person Profile
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // status of lead
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: leadStatusColor,
                      ),
                      child: Text(
                        widget.leadStatus!,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // sized box for
                    const SizedBox(height: 35.0),

                    // profile

                    Container(
                      width: 42.5,
                      height: 42.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ));
  }
}
