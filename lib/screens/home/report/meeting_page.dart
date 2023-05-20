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
  late CalendarFormat _calendarFormat;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late Stream<List<DocumentSnapshot>> _meetingsStream;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _firstDay = DateTime(2010);
    _lastDay = DateTime(2050);
    _meetingsStream = _getMeetingsStream();
  }

  Stream<List<DocumentSnapshot>> _getMeetingsStream() {
    return FirebaseFirestore.instance
        .collection('Meetings')
        .where('Date', isEqualTo: _selectedDay)
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs);
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
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _meetingsStream = _getMeetingsStream();
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'Meetings for ${DateFormat('yyyy-MM-dd').format(_selectedDay)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: StreamBuilder<List<DocumentSnapshot>>(
              stream: _meetingsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                final meetings = snapshot.data;
                if (meetings == null || meetings.isEmpty) {
                  return Center(child: Text('No meetings found.'));
                }

                return ListView(
                  children: meetings.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return MeetingCardWidget(
                      title: data['Title'],
                      clientFirstName: data['Client First Name'],
                      clientLastName: data['Client Last Name'],
                      salesPerson: data['Sales Person'],
                      description: data['Description'],
                    );
                  }).toList(),
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
            MaterialPageRoute(builder: (context) => MeetingForm()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
