import 'package:crm/screens/admin/contacts/contact_detail_screen.dart';
import 'package:crm/screens/admin/contacts/contact_form.dart';
import 'package:crm/screens/admin/deals/deal_form.dart';
import 'package:crm/screens/admin/employee/employee_form.dart';
import 'package:crm/screens/home/report/feedback_form.dart';
import 'package:crm/screens/home/report/meeting_form.dart';
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
    Get.to(() => const MeetingForm());
  }

  // navigates from LeadPage() to LeadForm()
  static void goToLeadForm() {
    Get.to(() => const LeadForm());
  }

  static void goToFeedBackForm() {
    Get.to(() => const FeedbackForm());
  }

  static void gotTODealForm() {
    Get.to(() => const DealForm());
  }

  static void goToEmployeeForm() {
    Get.to(() => const EmployeeForm());
  }

  static void goToContactForm() {
    Get.to(() => const ContactForm());
  }

  static void goToContactDetailScreen() {
    Get.to(() => const ContactDetailScreen());
  }
}
