import 'package:crm/controllers/on_press_action.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  CalendarBuilders _calendarController = CalendarBuilders();
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        calendarBuilders: _calendarController,
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
        onDaySelected: (DateTime inputSelectedDay, DateTime inputFocusedDay) {
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
