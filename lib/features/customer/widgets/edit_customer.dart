import 'dart:typed_data';

import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../commons/widgets/k_text_form_field.dart';
import '../../../core/helpers/app_logger_helper.dart';
import '../../../core/theme/app_colors.dart';
import '../provider/customer_provider.dart';
class Editcustomer extends StatefulWidget {
  const Editcustomer({super.key});

  @override
  State<Editcustomer> createState() => _EditcustomerState();
}

class _EditcustomerState extends State<Editcustomer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: () { context.readCustomerProvider.resetAll();}, icon:Icon(Icons.arrow_back)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.readCustomerProvider.setDeliveryAgentEnable(
                  true,
                );

              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
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
                            right: context.screenWidth * 0.106,
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
                                      const String pageKey = "EditProfile";

                                      context.read<CustomerProvider>().setFileUploaded(pageKey, true);
                                      context.read<CustomerProvider>().setFileName(pageKey,fileName);

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
                                Consumer<CustomerProvider>(
                                  builder: (context, customerProvider, child) {
                                    const String pageKey = "EditProfile";

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
                                                  context.read<CustomerProvider>().removeFile(pageKey);
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
                                            borderRadius: BorderRadius.circular(4),
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


                SizedBox(height: context.screenHeight * 0.01),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: RichText(
                              text: TextSpan(children: [TextSpan(
                                text: 'Edit Proof',
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
                            right: context.screenWidth * 0.106,
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
                                      const String pageKey = "EditProof";

                                      context.read<CustomerProvider>().setFileUploaded(pageKey, true);
                                      context.read<CustomerProvider>().setFileName(pageKey,fileName);

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
                                Consumer<CustomerProvider>(
                                  builder: (context, customerProvider, child) {
                                    const String pageKey = "EditProof";

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
                                                  context.read<CustomerProvider>().removeFile(pageKey);
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
                                            borderRadius: BorderRadius.circular(4),
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
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "Aseem",
                  name: 'name',
                  label: 'name',
                  hintText: 'name',
                  isRequired: true,
                ),
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "mon tue thus",
                  name: 'name',
                  label: 'Add Delivery Days',
                  hintText: 'name',
                  isRequired: true,
                ),
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "10",
                  name: 'name',
                  label: 'Add Leave Date',
                  hintText: '21,22,25',
                  isRequired: true,
                ),
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "No:16 haji hussain st",
                  name: 'Address',
                  label: 'Address',
                  hintText: '22-02-22',
                  isRequired: true,
                ),
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "11234566678",
                  name: 'phone',
                  label: 'Phone Number',
                  hintText: '22-02-22',
                  isRequired: true,
                ),
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "10.1.25",
                  name: 'Address',
                  label: 'Plan',
                  hintText: '1 Litre',
                  isRequired: true,
                ),
                SizedBox(height: context.screenHeight * 0.012),
                KTextFormField(
                  initialValue: "10.1.25",
                  name: 'Address',
                  label: 'Litre Price',
                  hintText: '₹5000.00',
                  isRequired: true,
                ),
                KTextFormField(
                  initialValue: "10.1.25",

                  name: 'Address',
                  label: 'Joined At',
                  hintText: '22-22-22',
                  isRequired: true,
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
