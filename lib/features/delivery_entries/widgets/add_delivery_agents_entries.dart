import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_outlined_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddDeliveryAgentsEntries extends StatelessWidget {
  final VoidCallback onArrowBackTap;
  final VoidCallback onNextTap;

  const AddDeliveryAgentsEntries({
    super.key,
    required this.onArrowBackTap,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.01,
        vertical: context.screenHeight * 0.02,
      ),
      width: context.screenWidth * 0.5,
      color: AppColors.whiteColor,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Arrow Back
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  onPressed: () {
                    // On Arrow Back Tap
                    onArrowBackTap();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.deliveryCardTextColor,
                  ),
                ),
              ),

              const Spacer(),

              // Next Btn
              KButton(
                text: "Next",
                onPressed: () {
                  // On Next Tap
                  onNextTap();
                },
                backgroundColor: AppColors.primaryColor,
                borderRadius: context.screenWidth * 0.002,
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.04),

          // Delivered By
          Text(
            'Delivered By',
            style: TextStyle(
              fontSize: context.screenWidth * 0.01,
              fontWeight: FontWeight.w600,
              color: AppColors.titleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Add Delivery Boys
          KTextFormField(
            name: "Add Delivery boys",
            hintText: "Add Delivery boys",
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.searchHintTextColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.04),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image
              KCachedNetworkProfileImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1610088441520-4352457e7095?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                //imageUrl: vendorDetails["imageUrl"]!,
                height: context.screenWidth * 0.03,
                width: context.screenWidth * 0.03,
              ),

              SizedBox(width: context.screenWidth * 0.005),

              Column(
                spacing: context.screenHeight * 0.002,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    "Mohammed Tariq",
                    // vendorDetails['name'] ?? 'N/A',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.01,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                    ),
                  ),

                  // Phone Number
                  Text(
                    "+91 6369476256",
                    // '+91 ${vendorDetails['phone'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.009,
                      fontWeight: FontWeight.w400,
                      color: AppColors.assignedCustomerCardSubTitleColor,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Remove Btn
              KOutlinedButton(
                onTap: () {},
                btnTitle: "Add",
                btnBorderColor: AppColors.deliveryCardTextColor,
                btnTextColor: AppColors.deliveryCardTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
