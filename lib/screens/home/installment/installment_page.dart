
import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';

import '../../../utility/widget/appbar.dart';

class InstallmentPage extends StatelessWidget {
  const InstallmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarInstallmentPageTitle),
      body: const Center(
        child:
        Text("Installment"),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () {  },
      ),
    );
  }
}

