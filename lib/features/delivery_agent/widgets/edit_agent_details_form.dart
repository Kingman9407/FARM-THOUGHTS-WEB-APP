import 'dart:typed_data';

import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_date_picker.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_time_picker.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../provider/delivery_agents_provider.dart';

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
                IconButton(
                  onPressed: () {
                    context.readDeliveryAgentsProvider.resetAll();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                KButton(
                  text: "Next",
                  onPressed: () {
                    context.readDeliveryAgentsProvider.setEditNextButtonClicked(
                      true,
                    );
                  },
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: RichText(
                                  text: TextSpan(children: [TextSpan(
                                    text: 'Edit Profile',
                                    style: TextStyle(
                                      color: AppColors.titleColor,
                                      fontSize: context.screenWidth * 0.008,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                    TextSpan(
                                      text: " *",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: context.screenWidth * 0.008,


                                      ),
                                    )
                                  ]

                                  )
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                right: context.screenWidth * 0.097,
                                top: context.screenHeight * 0.005,
                                bottom: context.screenHeight * 0.005,
                                left: context.screenWidth * 0.005,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.searchHintTextColor),
                                borderRadius: BorderRadius.circular(context.screenWidth * 0.004),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(

                                  spacing: 10,
                                  children: [
                                    ElevatedButton(

                                      onPressed: () async {
                                        AppLoggerHelper.logInfo('taps');
                                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                                          type: FileType.image,
                                          allowMultiple: false,


                                        );
                                        if (result != null && result.files.isNotEmpty) {
                                          Uint8List? fileBytes = result.files.first.bytes;
                                          String fileName = result.files.first.name;
                                          print("Picked file: $fileName");
                                          print("Size: ${fileBytes?.length} bytes");
                                          const String pageKey = "EditProfileUpload";

                                          context.read<DeliveryAgentsProvider>().setFileUploaded(pageKey, true);
                                          context.read<DeliveryAgentsProvider>().setFileName(pageKey,fileName);

                                        } else {
                                          print("No file selected");
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: context.screenWidth * 0.004,
                                          vertical: context.screenHeight * 0.003,
                                        ),
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        'upload',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                    Consumer<DeliveryAgentsProvider>(
                                      builder: (context, customerProvider, child) {
                                        const String pageKey = "EditProfileUpload";

                                        final containerWidth = context.screenWidth * 0.08 - 50;
                                        final containerHeight = context.screenHeight * 0.04;

                                        if (customerProvider.isFileUploaded(pageKey)) {
                                          final fileName = customerProvider.getFileName(pageKey) ?? "";
                                          final visibleCount = 2; // number of starting letters to show
                                          final obscuredText = fileName.isNotEmpty
                                              ? fileName.substring(0, visibleCount) + '*' * (fileName.length - visibleCount)
                                              : "";

                                          return SizedBox(
                                            width: containerWidth,
                                            height: containerHeight,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: context.screenWidth * 0.01,
                                                    vertical: context.screenHeight * 0.01,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: AppColors.hintTextFormFiledColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      obscuredText,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -5,
                                                  right: -5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // your remove logic here
                                                      context.read<DeliveryAgentsProvider>().removeFile(pageKey);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(1),
                                                      decoration: BoxDecoration(
                                                        shape:BoxShape.circle,
                                                        color: Colors.red,

                                                      ),
                                                      child: const Icon(
                                                        Icons.close_rounded,
                                                        size: 16,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return SizedBox(
                                            width: containerWidth,
                                            height: containerHeight,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: context.screenWidth * 0.025,
                                                vertical: context.screenHeight * 0.01,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(context.screenWidth * 0.004),
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    )




                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      ],
                    ),
                    KTextFormField(
                      name: 'agentName',
                      label: 'Agent Name',
                      hintText: 'Enter Agent name',
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
                      isMobileNo: true,
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

                    KTimePicker(
                      name: "workTime",
                      label: "Work time",
                      isRequired: true,
                      initialStartTime: const TimeOfDay(hour: 9, minute: 0),
                      initialEndTime: const TimeOfDay(hour: 18, minute: 0),
                      onChanged: (start, end) {
                        print(
                          "Selected: ${start.format(context)} - ${end.format(context)}",
                        );
                      },
                    ),
                    KDatePicker(
                      name: "joinedDate",
                      label: "Joined at",
                      isRequired: true,
                      initialDate: DateTime.now(),
                      onChanged: (date) {
                        print("Selected date: $date");
                      },
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
