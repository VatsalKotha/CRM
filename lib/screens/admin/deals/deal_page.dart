import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/deal_card_widget.dart';
import 'package:flutter/material.dart';

import '../../../utility/widget/appbar.dart';

class DealPage extends StatelessWidget {
  const DealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarDealPageTitle),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            DealCardWidget(
                dealName: "100 Deshackle",
                dealStatus: "Working",
                dealClosingDate: "13 June 2023",
                dealPriority: "Low",
                dealCompanyName: "ABC Company",
                dealPersonName: "Ramesh"),
            DealCardWidget(
                dealName: "100 Deshackle",
                dealStatus: "Working",
                dealClosingDate: "13 June 2023",
                dealPriority: "Low",
                dealCompanyName: "ABC Company",
                dealPersonName: "Ramesh"),
          ],
        ),
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
