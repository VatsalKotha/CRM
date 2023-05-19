import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/screens/auth/database/AddFeedback.dart';
import 'package:crm/screens/auth/database/fetch_feedback.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:crm/utility/widget/feedback_card_widget.dart';

import '../../../constants/text_string.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<Map<String, dynamic>> feedbackList = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic result = await FetchFeedback().getFeedbackList();

    if (result == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        feedbackList = (result as List<dynamic>).cast<Map<String, dynamic>>();
        // leadList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: feedbackList.length,
          itemBuilder: (context, index) {
            return FeedbackCardWidget(
                title: feedbackList[index]["Title"],
                date: feedbackList[index]["Date"],
                description: feedbackList[index]["Description"],
                feedbackcname: feedbackList[index]["Client Name"],
                rating: feedbackList[index]["Rating"],
                phoneNumber: feedbackList[index]["Phone Number"]);
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () => OnPressAction.goToFeedBackForm(),
      ),
    );
  }
}
