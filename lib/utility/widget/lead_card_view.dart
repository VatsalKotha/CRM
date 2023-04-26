import 'package:flutter/material.dart';

class LeadCardView extends StatefulWidget {
  const LeadCardView({Key? key}) : super(key: key);

  @override
  State<LeadCardView> createState() => _LeadCardViewState();
}

class _LeadCardViewState extends State<LeadCardView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Lead_Title")),
    );
  }
}
