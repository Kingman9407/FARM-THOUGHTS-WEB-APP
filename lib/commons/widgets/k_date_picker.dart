import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class KDatePicker extends StatelessWidget {
  final String name;
  final String label;
  final bool isRequired;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime)? onChanged;

  const KDatePicker({
    super.key,
    required this.name,
    required this.label,
    this.isRequired = false,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
        FormBuilderDateTimePicker(
          name: name,
          initialValue: initialDate,
          firstDate: firstDate ?? DateTime(2000),
          lastDate: lastDate ?? DateTime(2100),
          inputType: InputType.date,
          decoration: const InputDecoration(
            isDense: true,
            hintText: "Select date",
            hintStyle: TextStyle(fontSize: 14),
            prefixIcon: Icon(Icons.calendar_today, size: 20),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(),
          ),
          style: const TextStyle(fontSize: 14),
          validator: isRequired
              ? FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ])
              : null,
          onChanged: (val) {
            if (val != null && onChanged != null) {
              onChanged!(val);
            }
          },
        ),
      ],
    );
  }
}
