import 'package:crm/screens/auth/forgot_password/forgot_password_mail_screen.dart';
import 'package:crm/screens/auth/login/loginScreen.dart';
import 'package:crm/screens/home/dashboard/dashboard_page.dart';
import 'package:crm/screens/home/home_page.dart';
import 'package:crm/screens/home/lead/lead_form.dart';
import 'package:crm/screens/home/profile/profile_page.dart';
import 'package:get/get.dart';

import '../screens/auth/forgot_password/forgot_password_sms_screen.dart';

class Routes {
  static String loginScreen = "/";
  static String forgotPasswordMailScreen = "/forgot_password_mail_screen";
  static String forgotPasswordSMSScreen = "/forgot_password_mail_screen";
  static String homePage = "/homePage";
  static String dashboardPage = "/dashboardPage";
  static String profiledPage = "/profilePage";
  static String otpScreen = "/otpScreen";
  static String leadForm = "/leadForm";

  static String getLoginScreenRoute() => loginScreen;
  static String getForgotPasswordMailScreenRoute() => forgotPasswordMailScreen;
  static String getForgotPasswordSMSScreenRoute() => forgotPasswordSMSScreen;
  static String getHomePageRoute() => homePage;
  static String getDashboardPageRoute() => dashboardPage;
  static String getProfilePageRoute() => profiledPage;
  static String getOtpScreenRoute() => otpScreen;
  static String getLeadFormRoute() => leadForm;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(
        name: forgotPasswordMailScreen,
        page: () => const ForgotPasswordMailScreen()),
    GetPage(
        name: forgotPasswordSMSScreen,
        page: () => const ForgotPasswordSMSScreen()),
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: dashboardPage, page: () => const DashboardPage()),
    GetPage(name: profiledPage, page: () => const ProfilePage()),
    GetPage(name: leadForm, page: () => const LeadForm()),
  ];
}
