import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class KTextFormField extends StatelessWidget {
  final String name;
  final String? label;
  final String hintText;
  final TextInputType? keyboardType;
  final bool isRequired;
  final String? initialValue;
  final List<String? Function(String?)>? validators;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? prefixIcon;
  final bool isMobileNo;

  const KTextFormField({
    super.key,
    required this.name,
    this.label,
    required this.hintText,
    this.keyboardType,
    this.isRequired = false,
    this.initialValue,
    this.validators,
    this.controller,
    this.maxLines,
    this.prefixIcon,
    this.isMobileNo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.screenHeight * 0.01,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
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
                          color: AppColors.checkOutColor,
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
          inputFormatters: isMobileNo
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ]
              : [],
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.searchHintTextColor,
              fontSize: context.screenWidth * 0.0084,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.004),
              borderSide: BorderSide(color: AppColors.searchHintTextColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.004),
              borderSide: BorderSide(color: AppColors.searchHintTextColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.004),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.checkOutColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.004),
              borderSide: const BorderSide(
                color: AppColors.checkOutColor,
                width: 1,
              ),
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
        FormBuilderValidators.required(
          errorText: '${label ?? "This field"} is required',
        ),
      );
    }

    // Add specific field validators based on label (if label exists)
    final labelText = label?.toLowerCase() ?? '';

    if (labelText.contains('phone')) {
      validatorList.add(
        FormBuilderValidators.match(
          RegExp(r'^\d{10}$'),
          errorText: 'Phone number must be 10 digits',
        ),
      );
    }

    if (labelText.contains('salary') || labelText.contains('price')) {
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

    if (labelText.contains('address')) {
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
