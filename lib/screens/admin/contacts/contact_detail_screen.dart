import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/text_string.dart';
import '../../../controllers/action_event.dart';
import '../../../utility/widget/appbar.dart';
import '../../../utility/widget/table_widget.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({Key? key}) : super(key: key);

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    if (names.isNotEmpty) {
      initials = names[0][0];
      if (names.length > 1) {
        initials += names[names.length - 1][0];
      }
    }
    return initials;
  }

  List<String> colors = [
    '0xFF3080FF',
    '0xFF32B82E',
    '0xFFE47522',
    '0xFFEBD100',
    '0xFFF75555',
    '0xFFCE4CC8',
    '0xFF717171',
    '0xFF2A33A5',
  ];

  IconButton buildIconButton({
    required IconData iconData,
    required Future<dynamic>? Function() onPressed,
  }) {
    return IconButton(
      iconSize: 40.0,
      onPressed: onPressed != null ? () async => await onPressed() : null,
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

  // Function to get random color
  Color getColorFromIndex(int index) {
    if (index >= 0 && index < colors.length) {
      String colorString = colors[index];
      int colorValue = int.parse(colorString);
      return Color(colorValue);
    }
    // Return a default color if the index is out of range
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
            title: jAppbarContactDetailScreenTitle,
            actions: [],
            centerTitle: false,
            automaticallyImplyLeading: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // icon & name
                  CircleAvatar(
                    radius: 28.0,
                    backgroundColor: getColorFromIndex(5),
                    child: Text(
                      getInitials("Jash Parmar"),
                      style: const TextStyle(color: Colors.white, fontSize: 25.0,fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    "Jash Parmar",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 3.0),

                  // number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("+91 9876543210",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xFF92D5F8),
                        ),
                        child: Text("Work",
                          style: TextStyle(fontSize: 18.0),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  // action button
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
                  const SizedBox(height: 30.0),

                  // contact details
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tableHeading(heading: 'Personal Details'),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  TableWidget(heading: "Phone Number", value: "9876543210"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableWidget(heading: "Phone Number", value: "9876543210"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableWidget(heading: "Phone Number", value: "9876543210"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // about this contact
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tableHeading(heading: 'Personal Details'),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  TableWidget(heading: "Phone Number", value: "9876543210"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableWidget(heading: "Phone Number", value: "9876543210"),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableWidget(heading: "Phone Number", value: "9876543210"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  // Notes
                  Card(
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tableHeading(heading: 'Personal Details'),
                          Text("Filing budget, invoice, purchases, etc. Filing budget, invoice, purchases, etc. Filing budget, invoice, purchases, etc. Filingbudget, invoice, purchases, etc.")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          ),
        ));
  }
}
