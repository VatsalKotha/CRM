import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/action_event.dart';
import 'package:crm/screens/auth/database/fetch_leads.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:crm/utility/widget/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadDetailScreen extends StatefulWidget {
  // final int index;
  const LeadDetailScreen(
      {Key? key,
      required this.leadName,
      // required this.leadId,
      required this.leadSalesPersonName,
      required this.leadStatus,
      required this.leadClosingDate,
      required this.leadCompanyName,
      required this.leadClientName,
      required this.leadClientPhnNo1,
      required this.leadPriority,
      this.leadEmailAddress,
      this.leadAddress,
      this.leadClientPhnNo2,
      this.leadWebsite,
      this.leadDescription,
      required this.leadCreatedBy,
      required this.leadModifiedBy,
      required this.leadDateCreated,
      required this.leadClientLastName,
      required this.leadLabel})
      : super(key: key);

  final String leadName;
  // final String leadId;
  final String leadSalesPersonName;
  final String leadStatus;
  final String leadClosingDate;
  final String leadCompanyName;
  final String leadClientName;
  final String leadClientPhnNo1;
  final String leadPriority;
  final String? leadEmailAddress;
  final String? leadAddress;
  final String? leadClientPhnNo2;
  final String? leadWebsite;
  final String? leadDescription;
  final String leadCreatedBy;
  final String leadModifiedBy;
  final String leadDateCreated;
  final String leadClientLastName;
  final String leadLabel;

  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen> {
  late final Stream<DocumentSnapshot> _documnetSnapshot;

  List leadList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _documentSnapshot =
        FirebaseFirestore.instance.collection("Lead").snapshots();

    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await FetchLeads().getLeadList();

    if (result == null) {
      print("Unable to retreive");
    } else {
      setState(() {
        leadList = result;
      });
    }
  }

  IconButton buildIconButton(
      {required IconData iconData, required VoidCallback onPressed}) {
    return IconButton(
      iconSize: 40.0,
      onPressed: onPressed,
      icon: Center(
        child: Icon(
          iconData,
          size: 35.0,
        ),
      ),
    );
  }

  Text tableHeading({required String heading}) {
    return Text(
      heading,
      textAlign: TextAlign.start,
      style: GoogleFonts.poppins(
        fontSize: 19.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color leadStatusColor;
    if (widget.leadStatus == "New") {
      leadStatusColor = const Color(0xFF92D5F8);
    } else if (widget.leadStatus == "Won") {
      leadStatusColor = const Color(0xFF45CA53);
    } else if (widget.leadStatus == "Lost") {
      leadStatusColor = const Color(0xFFF75555);
    } else {
      leadStatusColor = const Color(0xFFCE4CC8);
    }

    return Scaffold(
      appBar: const AppBarWidget(
          title: jAppbarLeadDetailScreenTitle,
          actions: [],
          centerTitle: false,
          automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // lead detail header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.leadName,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2.0),
                  // Text(widget.leadId, style: const TextStyle(fontSize: 13.5)),
                  const SizedBox(height: 5.0),
                  Text(widget.leadSalesPersonName,
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                  const SizedBox(height: 5.0),
                  // status
                  Container(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 1.0, bottom: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: leadStatusColor,
                    ),
                    child: Text(
                      widget.leadStatus,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      const Icon(Icons.date_range_outlined, size: 20.0),
                      Text(widget.leadClosingDate),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25.0),

              // lead action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIconButton(
                    iconData: Icons.local_phone_outlined,
                    onPressed: ActionEvent.phoneEventHandler,
                  ),
                  buildIconButton(
                    iconData: Icons.email_outlined,
                    onPressed: ActionEvent.emailEventHandler,
                  ),
                  buildIconButton(
                    iconData: Icons.edit_note_outlined,
                    onPressed: () => ActionEvent.editEventHandler(
                        leadName: widget.leadName,
                        leadStatus: widget.leadStatus,
                        leadDateCreated: widget.leadDateCreated,
                        leadClosingDate: widget.leadClosingDate,
                        leadClientName: widget.leadClientName,
                        leadClientPhnNo1: widget.leadClientPhnNo1,
                        leadSalesPersonName: widget.leadSalesPersonName,
                        leadCompanyName: widget.leadCompanyName,
                        leadPriority: widget.leadPriority,
                        leadLabel: widget.leadLabel,
                        leadLastName: widget.leadClientLastName),

                    // onPressed: ActionEvent.editEventHandler,
                  ),
                  buildIconButton(
                    iconData: Icons.delete_outline,
                    onPressed: ActionEvent.deleteEventHandler,
                  ),
                ],
              ),
              const SizedBox(height: 5.0),

              const Divider(thickness: 2.0),
              const SizedBox(height: 25.0),

              // lead details - main & others

              // heading
              tableHeading(heading: 'Lead Details'),
              const SizedBox(height: 10.0),
              Table(
                children: [
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Company Name",
                        value: widget.leadCompanyName,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Client Name",
                        value: widget.leadClientName,
                        isBold: true,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Phone Number",
                        value: widget.leadClientPhnNo1,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Lead Priority",
                        value: widget.leadPriority,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Sale's Person",
                        value: widget.leadSalesPersonName,
                        isBold: true,
                        valueColor: Colors.blue,
                        isUnderlined: true,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25.0),

              tableHeading(heading: 'Other Details'),
              const SizedBox(height: 10.0),
              Table(
                children: [
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Email Address",
                        value: widget.leadEmailAddress ?? "-",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Address",
                        value: widget.leadAddress ?? "-",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Phone Number",
                        value: widget.leadClientPhnNo2 ?? "-",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Website",
                        value: widget.leadWebsite ?? "-",
                        isUnderlined: true,
                        valueColor: Colors.blue,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Description",
                        value: widget.leadDescription ?? "-",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Created By",
                        value: widget.leadCreatedBy,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Modified By",
                        value: widget.leadModifiedBy,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Date Created",
                        value: widget.leadCreatedBy,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
