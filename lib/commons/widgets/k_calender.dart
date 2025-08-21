import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class KCalender extends StatefulWidget {
  const KCalender({super.key});
  @override
  State<KCalender> createState() => _KCalenderState();
}

class _KCalenderState extends State<KCalender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      rowHeight: 32,

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = selectedDay;
        });
      },
      focusedDay: _focusedDay,
      firstDay: DateTime(2025, 1, 1),
      lastDay: DateTime(2030, 12, 31),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(fontSize: 12),
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(fontSize: 10),
        outsideTextStyle: TextStyle(fontSize: 10, color: Colors.grey.shade400),
        weekendTextStyle: TextStyle(fontSize: 10),
        selectedTextStyle: TextStyle(fontSize: 11),
        todayTextStyle: TextStyle(fontSize: 11),
      ),
      daysOfWeekHeight: 22,

      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(fontSize: 10),
        weekendStyle: TextStyle(fontSize: 10),
      ),
    );
  }
}
