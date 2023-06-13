import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:crm/utility/widget/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/image_string.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.name,
    required this.empId,
    required this.designation,
    required this.phnNumber,
    required this.emailAddress,
    required this.address,
    required this.education,
    required this.skill,
    required this.officeEmailAddress,
    required this.department,
    required this.dateOfJoining,
    required this.workType,
    required this.jobDescription,
    required this.internalNotes,
  }) : super(key: key);

  final String name;
  final String empId;
  final String designation;
  final String phnNumber;
  final String emailAddress;
  final String address;
  final String education;
  final String skill;
  final String officeEmailAddress;
  final String department;
  final String dateOfJoining;
  final String workType;
  final String jobDescription;
  final String internalNotes;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          title: jAppbarProfilePageTitle,
          centerTitle: false,
          automaticallyImplyLeading: true,
          actions: []),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
          child: Column(
            children: [
              // header : profile pic + name & emp id
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    // profile pic
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellow,
                        image: const DecorationImage(
                            image: AssetImage(jLeadCardProfileImage)),
                      ),
                    ),
                    const SizedBox(width: 28.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // employee name
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32.5,
                          ),
                        ),
                        // employee id
                        Text(
                          widget.empId,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30.0),

              // designation
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 120.0, vertical: 8.0),
                color: const Color(0xFFF4F4F4),
                child: Text(
                  widget.designation,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(height: 30.0),

              // personal details
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      tableHeading(heading: 'Personal Details'),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Phone Number",
                                  value: widget.phnNumber),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "E-Mail Address",
                                  value: widget.emailAddress),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Address", value: widget.address),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Education",
                                  value: widget.education),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Skills", value: widget.skill),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // other details
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      tableHeading(heading: 'Professional Details'),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Office E-Mail",
                                  value: widget.officeEmailAddress),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Department",
                                  value: widget.department),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Date of Joining",
                                  value: widget.dateOfJoining),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Work Type", value: widget.workType),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableWidget(
                                  heading: "Job Description",
                                  value: widget.jobDescription),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // internal notes
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      tableHeading(heading: 'Internal Notes'),
                      Text(widget.internalNotes),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
