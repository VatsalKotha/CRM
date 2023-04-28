import 'package:crm/constants/text_string.dart';
import 'package:flutter/material.dart';

import '../../../../utility/widget/appbar.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: jAppbarContactPageTitle),
      body: const Center(
        child: Text("Contact Page"),
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
