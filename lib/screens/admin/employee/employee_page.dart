import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';
import '../../../controllers/on_press_action.dart';
import '../../../utility/widget/appbar.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarInstallmentPageTitle),
      body: const Center(
        child: Text("Employee Management"),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () => OnPressAction.gotTODealForm(),
      ),
    );
  }
}
