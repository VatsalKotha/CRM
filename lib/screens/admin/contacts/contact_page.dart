import 'package:crm/constants/text_string.dart';
import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/utility/widget/contact_list_tile_widget.dart';
import 'package:flutter/material.dart';
import '../../../utility/widget/appbar.dart';
import '../../auth/database/fetch_contacts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

List<Map<String, dynamic>> conList = [];

class _ContactPageState extends State<ContactPage> {
  List<Map<String, dynamic>> filteredConList = [];
  bool isAscending = true;

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await FetchContact().getLeadList();
    if (result == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        conList = (result as List<dynamic>).cast<Map<String, dynamic>>();
        filteredConList = List.from(conList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarContactPageTitle),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filteredConList.length,
              itemBuilder: (context, index) {
                final selectedMeeting = filteredConList[index];
                return ContactListTileWidget(
                  contactName: selectedMeeting["Name"],
                  contactPhnNo: selectedMeeting["Phone Number"],
                  color0to7: int.parse(selectedMeeting["Color"]),
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
        onPressed: () => OnPressAction.goToContactForm(),
      ),
    );
  }
}
