import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';

import '../../../../utility/widget/appbar.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarAdminDashboardPageTitle),
      body: const Center(
        child: Text("Admin Dashboard"),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
