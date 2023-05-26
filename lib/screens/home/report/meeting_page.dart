import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/utility/widget/meeting_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/widget/meeting_card_widget.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  List<dynamic> events = [];
  DateTime selectedDate = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  Map<DateTime, List<dynamic>> eventsByDate = {};

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Meetings').get();

      final List<dynamic> fetchedEvents = snapshot.docs
          .map((doc) => {
                ...doc.data(),
                'Date': DateTime.parse(doc['Date']),
              })
          .toList();

      setState(() {
        events = fetchedEvents;
        eventsByDate = groupEventsByDate(fetchedEvents);
      });
    } catch (e) {
      print('Error fetching events: $e');
    }
  }

  Map<DateTime, List<dynamic>> groupEventsByDate(List<dynamic> events) {
    final Map<DateTime, List<dynamic>> eventsByDate = {};

    for (final event in events) {
      final DateTime eventDate = event['Date'];

      if (eventsByDate.containsKey(eventDate)) {
        eventsByDate[eventDate]!.add(event);
      } else {
        eventsByDate[eventDate] = [event];
      }
    }

    return eventsByDate;
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022),
            lastDay: DateTime.utc(2024),
            focusedDay: selectedDate,
            calendarFormat: calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                calendarFormat = format;
              });
            },
            onPageChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            eventLoader: (date) {
              return eventsByDate[date] ?? [];
            },
            onDaySelected: onDaySelected,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: eventsByDate[selectedDate]?.length ?? 0,
              itemBuilder: (context, index) {
                final event = eventsByDate[selectedDate]?[index];
                return MeetingCardWidget(
                  title: event?['Title'] ?? '',
                  clientFirstName: event?['Client First Name'] ?? '',
                  clientLastName: event?['Client Last Name'] ?? '',
                  salesPerson: event?['Sales Person'] ?? '',
                  description: event?['Description'] ?? '',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Icon(Icons.add),
        onPressed: () => OnPressAction.goToMeetingFrom(),
      ),
    );
  }
}
