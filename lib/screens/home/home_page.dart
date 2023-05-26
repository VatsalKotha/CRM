import 'package:crm/screens/home/dashboard/dashboard_page.dart';
import 'package:crm/screens/home/installment/installment_page.dart';
import 'package:crm/screens/home/lead/lead_page.dart';
import 'package:crm/screens/home/profile/profile_page.dart';
import 'package:crm/screens/home/report/report_page.dart';
import 'package:crm/screens/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List pages = [
    const ReportPage(),
    const LeadPage(),
    const InstallmentPage(),
    const DashboardPage(),
    const ProfilePage(),
    const SettingPage(),
  ];

  void onTap(int index) {
    if (index > 2) {
      _showModalBottomSheet();
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          //height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 25.0,
              ),
              const Text("More Modules"),
              const SizedBox(
                height: 35.0,
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  Get.to(() => const ProfilePage());
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Setting'),
                onTap: () {
                  Get.to(() => const SettingPage());
                },
              ),

            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange[50],
        onTap: onTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            label: "Reports",
            icon: Icon(Icons.add_chart),
          ),
          BottomNavigationBarItem(
            label: "Lead",
            icon: Icon(Icons.people_alt_rounded),
          ),
          BottomNavigationBarItem(
            label: "Installment",
            icon: Icon(Icons.monetization_on_rounded),
          ),
          BottomNavigationBarItem(
            label: "More",
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
