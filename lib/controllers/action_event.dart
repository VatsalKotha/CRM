import 'package:flutter/foundation.dart';

class ActionEvent {
  static VoidCallback? phoneEventHandler() {
    if (kDebugMode) {
      print("Action Event : Phone action button was pressed");
    }
    return null;
  }

  static VoidCallback? emailEventHandler() {
    if (kDebugMode) {
      print("Action Event : Email action button was pressed");
    }
    return null;
  }

  static VoidCallback? editEventHandler() {
    if (kDebugMode) {
      print("Action Event : Edit action button was pressed");
    }
    return null;
  }

  // static VoidCallback? deleteEventHandler() {
  //   if (kDebugMode) {
  //     print("Action Event: Delete action button was pressed");
  //   }
  //   return null;
  // }

  static Future<void> deleteEventHandler() async {
    if (kDebugMode) {
      print("Action Event: Delete action button was pressed for leadId: ");
    }
  }
}
