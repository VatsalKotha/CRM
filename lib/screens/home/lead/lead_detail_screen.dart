
import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/action_event.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:crm/utility/widget/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadDetailScreen extends StatefulWidget {
  const LeadDetailScreen({Key? key, required this.leadName}) : super(key: key);

  final String leadName;



  @override
  State<LeadDetailScreen> createState() => _LeadDetailScreenState();
}

class _LeadDetailScreenState extends State<LeadDetailScreen> {

  IconButton buildIconButton({required IconData iconData, required VoidCallback onPressed}) {
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
    return Scaffold(
      appBar: const AppBarWidget(
          title: jAppbarLeadDetailScreenTitle,
          actions: [],
          centerTitle: false,
          automaticallyImplyLeading: true),
      body: Container(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // lead detail header
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.leadName, style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2.0),
                  const Text("lead id : MEL230001",style: TextStyle(fontSize: 13.5)),
                  const SizedBox(height: 5.0),
                  const Text("Ramesh Shah",style: TextStyle(fontSize: 18,)),
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 1.0, bottom: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: const Color(0xFFF75555),
                    ),
                    child: const Text(
                      "Lost",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: const [
                      Icon(Icons.date_range_outlined, size: 20.0),
                      Text("12 April 2023"),
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
                    onPressed: ActionEvent.editEventHandler,
                  ),
                  buildIconButton(
                    iconData: Icons.delete_outline,
                    onPressed: ActionEvent.deleteEventHandler,
                  ),

                ],
              ),
              const SizedBox(height: 5.0),
              const Divider(),
              const SizedBox(height: 25.0),

              // lead details - main & others

              // heading
              tableHeading(heading: 'Lead Details'),
              const SizedBox(height: 10.0),
              Table(
                children: const [
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Company Name",
                        value: "Logitech Pvt.LTD",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Client Name",
                        value: "John Shah",
                        isBold: true,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Phone Number",
                        value: "+91 9876543210",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Lead Priority",
                        value: "Low",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Sale's Person",
                        value: "Ramesh Shah",
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
                children: const [
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Email Address",
                        value: "johnshah@logitech.com",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Address",
                        value: "Navi Mumbai West",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Phone Number",
                        value: "+91 9876543210",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Website",
                        value: "logitech.org",
                        isUnderlined: true,
                        valueColor: Colors.blue,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Description",
                        value: "Hello World Hello World Hello World Hello ",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Created By",
                        value: "Issac Newton",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Modified By",
                        value: "Ramesh Shah",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Date Created",
                        value: "1 April 2023",
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
