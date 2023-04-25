
import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';

import '../../../utility/widget/appbar.dart';

class DealPage extends StatelessWidget {
  const DealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarDealPageTitle),
      body: const Center(
        child:
        Text("Deals"),
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

