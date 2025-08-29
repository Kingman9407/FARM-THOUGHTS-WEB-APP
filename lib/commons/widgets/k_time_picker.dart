import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class KTimePicker extends StatelessWidget {
  final String name;
  final String label;
  final bool isRequired;
  final TimeOfDay? initialStartTime;
  final TimeOfDay? initialEndTime;
  final void Function(TimeOfDay start, TimeOfDay end)? onChanged;

  const KTimePicker({
    super.key,
    required this.name,
    required this.label,
    this.isRequired = false,
    this.initialStartTime,
    this.initialEndTime,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildTimePicker(String fieldName, TimeOfDay? initial, bool isStart) {
      return SizedBox(
        width: 100,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: AppColors.primaryColor,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                hourMinuteTextColor: AppColors.primaryColor,
                dialHandColor: AppColors.primaryColor,
                entryModeIconColor: AppColors.primaryColor,
                dayPeriodTextColor: AppColors.primaryColor,
                dayPeriodColor: AppColors.primaryColor.withOpacity(0.1),
              ),
            ),
            child: FormBuilderDateTimePicker(
              format: DateFormat.jm(),
              name: fieldName,
              initialTime: initial ?? TimeOfDay.now(),
              inputType: InputType.time,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                suffixIconColor: AppColors.primaryColor,
              ),
              style: const TextStyle(fontSize: 12),
              onChanged: (val) {
                if (val != null && onChanged != null) {
                  if (isStart) {
                    onChanged!(
                      TimeOfDay.fromDateTime(val),
                      initialEndTime ?? TimeOfDay.now(),
                    );
                  } else {
                    onChanged!(
                      initialStartTime ?? TimeOfDay.now(),
                      TimeOfDay.fromDateTime(val),
                    );
                  }
                }
              },
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildTimePicker("${name}_start", initialStartTime, true),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                "TO",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            buildTimePicker("${name}_end", initialEndTime, false),
          ],
        ),
      ],
    );
  }
}
