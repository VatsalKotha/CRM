import 'package:crm/screens/admin/contacts/contact_page.dart';
import 'package:crm/screens/admin/deals/deal_page.dart';
import 'package:crm/screens/admin/employee/employee_page.dart';
import 'package:crm/screens/home/profile/profile_page.dart';
import 'package:flutter/material.dart';
import '../setting/setting_page.dart';
import 'dashboard/admin_dashboard.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int currentIndex = 0;
  List pages = [
    const ContactPage(),
    const DealPage(),
    const AdminDashboardPage(),
    const EmployeePage(),
    const ProfilePage(
        address: "Malad",
        department: 'IT',
        dateOfJoining: '2023 - 06 - 10',
        designation: 'Intern',
        education: 'Diploma',
        emailAddress: 'abcd@gmail.com ',
        empId: 'MEM123301',
        internalNotes: 'SAMPLE Text',
        workType: 'Part Time',
        jobDescription: 'Sample Text',
        name: 'Jash Parmar',
        officeEmailAddress: 'office@email.com',
        phnNumber: '1234567891',
        skill: 'Coding'),
    const SettingPage()
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
                title: const Text('Employee'),
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
                  setState(() {
                    currentIndex = 4;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Setting'),
                onTap: () {
                  setState(() {
                    currentIndex = 4;
                  });
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
            label: "Contact",
            icon: Icon(Icons.contact_phone),
          ),
          BottomNavigationBarItem(
            label: "Deals",
            icon: Icon(Icons.handshake),
          ),
          BottomNavigationBarItem(
            label: "Dashboard",
            icon: Icon(Icons.dashboard),
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
