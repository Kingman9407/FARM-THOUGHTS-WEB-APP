import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_time_picker.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddAgentForm extends StatefulWidget {
  final VoidCallback onClose;
  final Function(Map<String, String>) onAddVendor;

  const AddAgentForm({
    super.key,
    required this.onClose,
    required this.onAddVendor,
  });

  @override
  State<AddAgentForm> createState() => _AddAgentFormState();
}

class _AddAgentFormState extends State<AddAgentForm> {
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
      AppLoggerHelper.logWarning('Vendor data being sent: $vendorData');

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Header row stays fixed at the top
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add New Agent',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ Only this part scrolls
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  spacing: context.screenWidth * 0.012,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KTextFormField(
                      name: 'agentName',
                      label: 'Agent Name',
                      hintText: 'Enter agent name',
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      isRequired: true,
                    ),

                    KTimePicker(
                      name: 'working_hours',
                      label: 'Working Hours',
                      isRequired: true,
                      initialStartTime: const TimeOfDay(hour: 9, minute: 0),
                      initialEndTime: const TimeOfDay(hour: 17, minute: 0),
                      onChanged: (start, end) {
                        AppLoggerHelper.logWarning(
                          "Start: ${start.format(context)}, End: ${end.format(context)}",
                        );
                      },
                    ),
                    KTextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      name: 'assignedCustomers',
                      label: 'Assigned Customers',
                      hintText: '48',
                      controller: assignedCustomersController,
                      keyboardType: TextInputType.number,
                      isRequired: true,
                    ),
                    const SizedBox(height: 12),
                    // KTextFormField(
                    //   name: 'imageUrl',
                    //   label: 'Image URL',
                    //   hintText: 'http://example.com/image.jpg',
                    //   controller: imgController,
                    //   isRequired: false,
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              side: BorderSide(color: AppColors.primaryColor),
                            ),
                            onPressed: _handleCancel,
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _handleAddVendor,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Add Agent',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
