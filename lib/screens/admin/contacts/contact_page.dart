
import 'package:crm/constants/text_string.dart';
import 'package:crm/utility/widget/contact_list_tile_widget.dart';
import 'package:flutter/material.dart';

import '../../../utility/widget/appbar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarContactPageTitle),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ContactListTileWidget(
              contactName: "Jash Parmar",
              contactPhnNo: "9876543210",
              color0to7: 1,
            ),
            ContactListTileWidget(
              contactName: "Vatsal Kotha",
              contactPhnNo: "9876543210",
              color0to7: 6,
            ),
          ],
        ),
      ),

      // button for contact form
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
