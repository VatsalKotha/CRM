import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/setting_ui_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utility/widget/appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Padding headingText(String title) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: const Color(0xFF3B3B3B),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBarWidget(
          title: jAppbarSettingPageTitle,
          centerTitle: false,
          automaticallyImplyLeading: true,
          actions: []),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Authentication Settings
              headingText("Authentication Settings"),
              const SettingWidget(
                title: "Change Phone Number",
                description: "Update your registered phone number",
              ),
              const SettingWidget(
                title: "Change E-mail Address",
                description: "Update your registered email address",
              ),
              const SizedBox(height: 25.0),


              // Help & Support
              headingText("Help & Support"),
              const SettingWidget(title: "Contact Us", description: "Get in touch with our support team"),
              const SettingWidget(title: "About Us", description: "Learn more about our company"),
              const SettingWidget(title: "Acknowledgment",description: "Thanks to our supporting team"),
              const SizedBox(height: 25.0),


              // Privacy & Security
              headingText("Privacy & Security"),
              const SettingWidget(title: "Allow Notification", description: "Enable or disable app notifications"),
              const SettingWidget(title: "App Lock", description: "Set a passcode authentication to secure the app."),
              const SettingWidget(title: "Two Factor Authentication", description: "Add an extra layer of security to your account."),
              const SettingWidget(title: "Company Policy", description: "Detailed reviews of company's policy"),
              const SizedBox(height: 25.0),


              // Logout
              headingText("Logout"),
              const SettingWidget(title: "Logout", description: "",icon: Icons.power_settings_new,iconColor: Colors.red),
              const SizedBox(height: 50.0),

            ],
          ),
        ),
      ),
    );
  }
}
