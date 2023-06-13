import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionEvent {

  static Future phoneEventHandler({required String phnNumber}) async {
    if (kDebugMode) {
      print("Action Event : Phone action button was pressed");
    }

    final Uri phone = Uri(
      scheme: 'tel',
      path: phnNumber,
    );
    if (await canLaunchUrl(phone)) {
      await launchUrl(phone);
    }
  }

  static Future emailEventHandler({required String toEmail}) async {
    if (kDebugMode) {
      print("Action Event: Email action button was pressed");
    }

    final Uri email = Uri(
      scheme: 'mailto',
      path: toEmail,
      query:
          'subject=${Uri.encodeComponent("")}&body=${Uri.encodeComponent("")}',
    );

    if (await canLaunchUrl(email)) {
      await launchUrl(email);
    }
  }

  static Future? editEventHandler() {
    if (kDebugMode) {
      print("Action Event : Edit action button was pressed");
    }
    return null;
  }

  static Future? deleteEventHandler() {
    if (kDebugMode) {
      print("Action Event : Delete action button was pressed");
    }
    return null;
  }
}
