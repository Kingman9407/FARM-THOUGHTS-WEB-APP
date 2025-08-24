import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class KTextFormField extends StatelessWidget {
  final String name;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final bool isRequired;
  final String? initialValue;
  final List<String? Function(String?)>? validators;
  final TextEditingController? controller;
  final int? maxLines;

  const KTextFormField({
    super.key,
    required this.name,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.isRequired = false,
    this.initialValue,
    this.validators,
    this.controller,
    this.maxLines,
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
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ]
                : [],
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: name,
          controller: controller,
          keyboardType: keyboardType,
          initialValue: initialValue,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: maxLines != null && maxLines! > 1 ? 12 : 10,
            ),
          ),
          validator: _buildValidator(),
        ),
      ],
    );
  }

  FormFieldValidator<String>? _buildValidator() {
    if (!isRequired && (validators == null || validators!.isEmpty)) {
      return null;
    }

    List<String? Function(String?)> validatorList = [];

    // Add required validator if needed
    if (isRequired) {
      validatorList.add(
        FormBuilderValidators.required(errorText: '$label is required'),
      );
    }

    // Add specific field validators based on label
    if (label.toLowerCase().contains('phone')) {
      validatorList.add(
        FormBuilderValidators.match(
          RegExp(r'^\d{10}$'),
          errorText: 'Phone number must be 10 digits',
        ),
      );
    }

    if (label.toLowerCase().contains('salary') ||
        label.toLowerCase().contains('price')) {
      validatorList.add(
        FormBuilderValidators.numeric(errorText: 'Enter a valid amount'),
      );
      validatorList.add(
        FormBuilderValidators.min(
          0.01,
          errorText: 'Amount must be greater than 0',
        ),
      );
    }

    if (label.toLowerCase().contains('address')) {
      validatorList.add(
        FormBuilderValidators.minLength(
          10,
          errorText: 'Address must be at least 10 characters',
        ),
      );
    }

    // Add custom validators if provided
    if (validators != null) {
      validatorList.addAll(validators!);
    }

    // Return composed validator
    return FormBuilderValidators.compose(validatorList);
  }
}
