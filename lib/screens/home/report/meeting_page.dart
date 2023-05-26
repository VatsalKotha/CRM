
import 'package:crm/controllers/on_press_action.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../utility/widget/meeting_card_widget.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [

              // meeting calendar
              TableCalendar(
                focusedDay: selectedDay,
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
                    )
                ),

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
                  setState(() {
                    selectedDay = inputSelectedDay;
                    focusedDay = inputFocusedDay;
                  });
                },
              ),
              const Divider(thickness: 3.0),


              // meeting cards
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8.0,right: 8.0,top: 0.0,bottom: 20.0),
                    child: Column(
                      children: const [
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                        MeetingCardWidget(),
                      ],
                    ),
                  )
                ),
              ),
            ],
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
