import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
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
      spacing: context.screenHeight * 0.01,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: TextStyle(
              color: AppColors.titleColor,
              fontSize: context.screenWidth * 0.008,
              fontWeight: FontWeight.w600,
            ),
            children: isRequired
                ? [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: AppColors.titleColor,
                        fontSize: context.screenWidth * 0.008,
                      ),
                    ),
                  ]
                : [],
          ),
        ),

        FormBuilderTextField(
          style: TextStyle(
            color: AppColors.titleColor,
            fontSize: context.screenWidth * 0.0084,
            fontWeight: FontWeight.w600,
          ),
          name: name,
          controller: controller,
          keyboardType: keyboardType,
          initialValue: initialValue,
          maxLines: maxLines ?? 1,
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
