
import 'package:get/get.dart';
import '../screens/home/lead/lead_form.dart';

class OnPressAction {

  /*
     -->> Methods for navigate user from various page to various form <<--
  on press function for floating action button of the "MeetingPage(), LeadPage()"
  This function navigates the user to the Form()
  */

  // navigates from MeetingPage() to MeetingForm()
  static void goToMeetingFrom() {
    Get.to(() => const LeadForm());
  }

  // navigates from LeadPage() to LeadForm()
  static void goToLeadForm() {
    Get.to(() => const LeadForm());
  }

}