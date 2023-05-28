import 'package:crm/utility/widget/appbar.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_string.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: jAppbarDashboardPageTitle, actions: []),
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
