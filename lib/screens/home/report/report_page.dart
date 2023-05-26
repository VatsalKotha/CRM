import 'package:crm/constants/text_string.dart';
import 'package:crm/screens/home/report/feedback_page.dart';
import 'package:crm/screens/home/report/meeting_page.dart';
import 'package:crm/utility/widget/appbar.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarWidget(title: jAppbarReportPageTitle),
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(
                  text: "Feedback",
                ),
                Tab(
                  text: "Meeting",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                // Feedback
                FeedbackScreen(),

                // Meeting Tab
                MeetingPage(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
