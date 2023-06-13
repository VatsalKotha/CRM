
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/text_string.dart';
import '../../../controllers/action_event.dart';
import '../../../utility/widget/appbar.dart';
import '../../../utility/widget/table_widget.dart';

class MeetingDetailScreen extends StatefulWidget {
  const MeetingDetailScreen({Key? key}) : super(key: key);

  @override
  State<MeetingDetailScreen> createState() => _MeetingDetailScreenState();
}

class _MeetingDetailScreenState extends State<MeetingDetailScreen> {

  IconButton buildIconButton({
    required IconData iconData,
    required Future<dynamic>? Function() onPressed,
  }) {
    return IconButton(
      iconSize: 40.0,
      onPressed: () => onPressed(),
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
                children: const [
                  Text("Product Reselling Meet",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  SizedBox(height: 2.0),
                  Text("meet id : MEM230001", style: TextStyle(fontSize: 13.5)),
                  SizedBox(height: 5.0),
                  Text("Vatsal Kotha",
                      style: TextStyle(
                        fontSize: 17,)
                  ),
                  SizedBox(height: 5.0),
                  Text("Monday 12 June 2023",
                      style: TextStyle(
                        fontSize: 17,)
                  ),
                ],
              ),
              const SizedBox(height: 25.0),

              // meeting action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIconButton(
                    iconData: Icons.local_phone_outlined,
                    onPressed: () => ActionEvent.phoneEventHandler(phnNumber: '9326434589'),
                  ),
                  buildIconButton(
                    iconData: Icons.email_outlined,
                    onPressed: () => ActionEvent.emailEventHandler(toEmail: "daltonjd45@gmail.com"),
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

              // divider
              const Divider(thickness: 2.0),
              const SizedBox(height: 25.0),

              // lead details - main & others

              // heading
              tableHeading(heading: 'Meeting Details'),
              const SizedBox(height: 10.0),
              Table(
                children: const [
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Client Name",
                        value: "John Shah",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Meeting Type",
                        value: "Online",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Phone Number",
                        value: "9876543210",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Host",
                        value: "Vatsal Kotha",
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
                        heading: "E-Mail Address",
                        value: "jash4305@gmail.com",
                        isUnderlined: true,
                        valueColor: Colors.blue,
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Company Name",
                        value: "ABC Company",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Notes",
                        value: "This is the short description about the meeting in word. Sample text.",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Created By",
                        value: "Jash Parmar",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Modified By",
                        value: "Jash Parmar",
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget(
                        heading: "Date Created",
                        value: "12 June 2023",
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
