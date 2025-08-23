import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    super.key,
    required this.controller,
    this.initialValue,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final DateTime? initialValue;
  final bool readOnly;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: FormBuilderDateTimePicker(
        disablePicker: widget.readOnly,
        onChanged: (value) {
          if (value != null) {
            widget.controller.text = DateFormat("dd/MM/yyyy").format(value);
          }
          setState(() {});
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        name: "DOB",
        initialValue:
            widget.initialValue ??
            (widget.controller.text.trim().isEmpty
                ? DateTime.now()
                : DateFormat(
                    "dd/MM/yyyy",
                  ).parse(widget.controller.text.trim())),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        inputType: InputType.date,
        format: DateFormat("dd/MM/yyyy"),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "D.O.B",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.calendar_today),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        validator: FormBuilderValidators.required(
          errorText: "Date of Birth is required",
        ),
      ),
    );
  }
}
