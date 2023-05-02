import 'package:crm/controllers/on_press_action.dart';
import 'package:crm/screens/auth/database/event_firstore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:crm/screens/auth/database/event.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    selectedEvents = {};
    // TODO: implement initState
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime(2010),
            lastDay: DateTime(2050),
            calendarFormat: calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
                formatButtonVisible: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: const Color(0xFFB3E5FC),
                  borderRadius: BorderRadius.circular(8.0),
                )),
            eventLoader: _getEventsfromDay,
            // to style the calendar
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              // decoration for the current date
              todayDecoration: BoxDecoration(
                color: Color(0xFFFFB466),
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

              // decoration for the selected date
              selectedDecoration: BoxDecoration(
                color: Color(0xFFE4EFFA),
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(shape: BoxShape.circle),
              selectedTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),

            selectedDayPredicate: (DateTime inputDate) {
              return isSameDay(selectedDay, inputDate);
            },
            onFormatChanged: (CalendarFormat inputFormat) {
              setState(() {
                calendarFormat = inputFormat;
              });
            },
            onDaySelected:
                (DateTime inputSelectedDay, DateTime inputFocusedDay) {
              if (!isSameDay(inputSelectedDay, inputFocusedDay)) {
                setState(() {
                  selectedDay = inputSelectedDay;
                  focusedDay = inputFocusedDay;
                });
              }
            },
            onPageChanged: (inputFocusedDay) {
              focusedDay = inputFocusedDay;
            },
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
