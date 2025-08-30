import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';

import '../../../core/theme/app_colors.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.arrow_back),
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
                'Add New',
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
                        Text(
                          'upload Profile*',
                          style: TextStyle(
                            color: AppColors.btnIconColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            right: context.screenWidth * 0.115,
                            top: context.screenHeight * 0.005,
                            bottom: context.screenHeight * 0.005,
                            left: context.screenWidth * 0.005,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.hintTextFormFiledColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'upload',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.whiteColor,
                              ),
                            ),
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
                    Text(
                      'upload Proof*',
                      style: TextStyle(
                        color: AppColors.btnIconColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        right: context.screenWidth * 0.115,
                        top: context.screenHeight * 0.005,
                        bottom: context.screenHeight * 0.005,
                        left: context.screenWidth * 0.005,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.hintTextFormFiledColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'upload',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.whiteColor,
                          ),
                        ),
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
              name: 'name',
              label: 'name',
              hintText: 'name',
              isRequired: true,
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
              name: 'name',
              label: 'Add Delivery Days',
              hintText: 'name',
              isRequired: true,
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
              name: 'name',
              label: 'Add Leave Date',
              hintText: '21,22,25',
              isRequired: true,
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
              name: 'Address',
              label: 'Address',
              hintText: '22-02-22',
              isRequired: true,
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
              name: 'Address',
              label: 'Phone Number',
              hintText: '22-02-22',
              isRequired: true,
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
              name: 'Address',
              label: 'Plan',
              hintText: '1 Litre',
              isRequired: true,
            ),
            SizedBox(height: context.screenHeight * 0.012),
            KTextFormField(
                  name: 'Address',
                  label: 'Litre Price',
                  hintText: '₹5000.00',
                  isRequired: true,
                ),
                KTextFormField(
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
