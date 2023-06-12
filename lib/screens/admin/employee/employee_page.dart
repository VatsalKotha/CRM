import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/auth/database/fetch_employee.dart';
import 'package:flutter/material.dart';
import '../../../controllers/on_press_action.dart';
import '../../../utility/widget/appbar.dart';
import 'package:crm/utility/widget/contact_list_tile_widget.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

List<Map<String, dynamic>> emp = [];

class _EmployeePageState extends State<EmployeePage> {
  List<Map<String, dynamic>> filteredEmpList = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await FetchEmp().getLeadList();
    if (result == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        emp = (result as List<dynamic>).cast<Map<String, dynamic>>();
        filteredEmpList = List.from(emp);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarEmployeePageTitle),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmpList.length,
              itemBuilder: (context, index) {
                final contactName = filteredEmpList[index]["First Name"] ?? '';
                final contactPhnNo =
                    filteredEmpList[index]["Phone Number"] ?? '';
                final color0to7 = int.parse(filteredEmpList[index]["Color"]);
                return ContactListTileWidget(
                  contactName: contactName,
                  contactPhnNo: contactPhnNo,
                  color0to7: color0to7,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () => OnPressAction.goToEmployeeForm(),
      ),
    );
  }
}
