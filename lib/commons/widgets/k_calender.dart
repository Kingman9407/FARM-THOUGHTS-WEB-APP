import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class KCalender extends StatefulWidget {
  const KCalender({super.key});

  @override
  State<KCalender> createState() => _KCalenderState();
}

class _KCalenderState extends State<KCalender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  String _sortValue = "Weekly";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          rowHeight: 50,
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
            titleTextStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          calendarStyle: CalendarStyle(
            defaultTextStyle: const TextStyle(fontSize: 14),
            outsideTextStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
            weekendTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            selectedDecoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            todayDecoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 1.5),
              shape: BoxShape.circle,
            ),
            todayTextStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          daysOfWeekHeight: 28,

          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            weekendStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 24),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                child: const Text(
                  "Sort By",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),

              // Dropdown (dynamic)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _sortValue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: const [
                        DropdownMenuItem(
                          value: "Weekly",
                          child: Text("Weekly"),
                        ),
                        DropdownMenuItem(
                          value: "Monthly",
                          child: Text("Monthly"),
                        ),
                        DropdownMenuItem(
                          value: "Yearly",
                          child: Text("Yearly"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _sortValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
        KButton(
          backgroundColor: AppColors.primary,
          text: "Apply Filter",
          onPressed: () {
            debugPrint(
              "Filter Applied → Date: $_selectedDay, Sort: $_sortValue",
            );
          },
        ),
      ],
    );
  }
}
