
import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utility/widget/appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage(
      {Key? key,})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: const AppBarWidget(
          title: jAppbarSettingPageTitle,
          centerTitle: false,
          automaticallyImplyLeading: true,
          actions: []),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
              child: Text(
                "Authentication Settings".toUpperCase(),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: const Color(0xFF3B3B3B),
                ),
              ),
            ),
            ListTile(
              title: const Text("Change Phone Number"),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  color: Colors.black45, size: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              tileColor: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 5.0),
              child: Text(
                "Update your registered phone number",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Color(0xFF3B3B3B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
