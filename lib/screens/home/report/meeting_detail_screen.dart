
import 'package:flutter/material.dart';

class MeetingDetailScreen extends StatefulWidget {
  const MeetingDetailScreen({Key? key}) : super(key: key);

  @override
  State<MeetingDetailScreen> createState() => _MeetingDetailScreenState();
}

class _MeetingDetailScreenState extends State<MeetingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Meeting Detail View"),
      ),
    );
  }
}
