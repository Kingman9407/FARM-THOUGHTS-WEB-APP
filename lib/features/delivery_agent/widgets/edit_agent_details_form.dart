import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditAgentDetailsForm extends StatefulWidget {
  final VoidCallback onClose;
  final Function(Map<String, String>) onAddVendor;

  const EditAgentDetailsForm({
    super.key,
    required this.onClose,
    required this.onAddVendor,
  });

  @override
  State<EditAgentDetailsForm> createState() => _EditAgentDetailsFormState();
}

class _EditAgentDetailsFormState extends State<EditAgentDetailsForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController workTimeController = TextEditingController();
  final TextEditingController assignedCustomersController =
      TextEditingController();
  final TextEditingController imgController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    salaryController.dispose();
    workTimeController.dispose();
    assignedCustomersController.dispose();
    imgController.dispose();
    super.dispose();
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    salaryController.clear();
    workTimeController.clear();
    assignedCustomersController.clear();
    imgController.clear();
    _formKey.currentState?.reset();
  }

  void _handleAddVendor() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;

      final vendorData = {
        'name': formData['vendorName']?.toString().trim() ?? '',
        'phone': formData['mobileNumber']?.toString().trim() ?? '',
        'address': formData['address']?.toString().trim() ?? '',
        'salary': formData['salary']?.toString().trim() ?? '',
        'work_time': formData['workTime']?.toString().trim() ?? '',
        'assigned_customers':
            formData['assignedCustomers']?.toString().trim() ?? '0',
        'joined_date':
            '${DateTime.now().day.toString().padLeft(2, '0')},${_getMonthName(DateTime.now().month)},${DateTime.now().year}',
        'imageUrl': formData['imageUrl']?.toString().trim() ?? '',
      };

      // Debug print to check the data
      AppLoggerHelper.logResponse(vendorData);
      widget.onAddVendor(vendorData);
      _clearForm();
      widget.onClose();
    }
  }

  void _handleCancel() {
    _clearForm();
    widget.onClose();
  }

  String _getMonthName(int month) {
    const months = [
      '',
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
      width: context.screenWidth * 0.5,
      color: AppColors.whiteColor,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          spacing: context.screenWidth * 0.009,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                KButton(
                  text: "Next",
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Edit Agent Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KTextFormField(
                      name: 'vendorName',
                      label: 'Vendor Name',
                      hintText: 'Enter vendor name',
                      controller: nameController,
                      isRequired: true,
                    ),
                    KTextFormField(
                      name: 'address',
                      label: 'Address',
                      hintText: 'Enter complete address',
                      controller: addressController,
                      isRequired: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                    ),
                    KTextFormField(
                      name: 'mobileNumber',
                      label: 'Phone Number',
                      hintText: 'Enter 10-digit phone number',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      isRequired: true,
                    ),
                    KTextFormField(
                      name: 'salary',
                      label: 'Monthly Salary',
                      hintText: '₹5,000',
                      controller: salaryController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      isRequired: true,
                    ),
                    KTextFormField(
                      name: 'workTime',
                      label: 'Work Time',
                      hintText: '9am-12pm',
                      controller: workTimeController,
                      isRequired: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
