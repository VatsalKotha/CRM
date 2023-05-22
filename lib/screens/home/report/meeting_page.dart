import 'package:crm/screens/auth/database/fetch_meetings.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:crm/screens/home/report/meeting_form.dart';
import 'package:crm/utility/widget/meeting_card_widget.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<Map<String, dynamic>> meetingList = [];

  late CalendarFormat _calendarFormat;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late Stream<List<Map<String, dynamic>>> _meetingsStream;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime(2010);
    _lastDay = DateTime(2050);
    // _meetingsStream = _getMeetingsStream(_selectedDay);
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    List<Map<String, dynamic>> result = await FetchMeetings().getMeetings();

    // ignore: unnecessary_null_comparison
    if (result == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        meetingList = result;
        // filteredLeadList = List.from(leadList);
      });
    }
  }

  // Stream<List<Map<String, dynamic>>> _getMeetingsStream(DateTime selectedDay) {
  //   return FirebaseFirestore.instance
  //       .collection('Meetings')
  //       .where('Date', isEqualTo: Timestamp.fromDate(selectedDay))
  //       .snapshots()
  //       .map((QuerySnapshot querySnapshot) => querySnapshot.docs
  //           .map((doc) => doc.data() as Map<String, dynamic>)
  //           .toList());
  // }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      // _meetingsStream = _getMeetingsStream(selectedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: _firstDay,
            lastDay: _lastDay,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            onDaySelected: _onDaySelected,
          ),
          const SizedBox(height: 16),
          Text(
            'Meetings for ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: meetingList.length,
              itemBuilder: (context, index) {
                final data = meetingList[index];
                return MeetingCardWidget(
                  title: data['Title'],
                  clientFirstName: data['Client First Name'],
                  clientLastName: data['Client Last Name'],
                  salesPerson: data['Sales Person'],
                  description: data['Description'],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MeetingForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
