
import 'package:flutter/material.dart';
import '../../../constants/text_string.dart';
import '../../../utility/widget/appbar.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
          title: jAppbarContactDetailScreenTitle,
          actions: [],
          centerTitle: false,
          automaticallyImplyLeading: true),
      body: Center(
        child: Text("Contact Detail Screen"),
      ),
    );
  }
}
