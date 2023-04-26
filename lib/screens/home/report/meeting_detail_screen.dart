
import 'package:flutter/material.dart';

import '../../../constants/text_string.dart';
import '../../../utility/widget/appbar.dart';

class MeetingDetailScreen extends StatefulWidget {
  const MeetingDetailScreen({Key? key}) : super(key: key);

  @override
  State<MeetingDetailScreen> createState() => _MeetingDetailScreenState();
}

class _MeetingDetailScreenState extends State<MeetingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
          title: jAppbarMeetingDetailScreenTitle,
          actions: [],
          centerTitle: false,
          automaticallyImplyLeading: true),
      body: Center(
        child: Text("Meeting Detail View"),
      ),
    );
  }
}
