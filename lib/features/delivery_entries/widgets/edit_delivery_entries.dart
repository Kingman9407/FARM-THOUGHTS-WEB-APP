import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_outlined_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EditDeliveryEntries extends StatelessWidget {
  final VoidCallback onArrowBackTap;
  final VoidCallback onNextTap;

  const EditDeliveryEntries({
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
                    // Arrow Back Tap
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
                  onNextTap();
                },
                backgroundColor: AppColors.primaryColor,
                borderRadius: context.screenWidth * 0.002,
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.04),

          // Edit Customer
          Text(
            'Edit Customer',
            style: TextStyle(
              fontSize: context.screenWidth * 0.01,
              fontWeight: FontWeight.w600,
              color: AppColors.titleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Add Customer
          KTextFormField(
            name: "Add Customer",
            hintText: "Add Customer",
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.searchHintTextColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Added Customer
          Row(
            children: [
              // Added Customer
              Text(
                'Added Customer',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.01,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleColor,
                ),
              ),

              const Spacer(),

              // Total Members
              Text(
                '2 Members',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.008,
                  fontWeight: FontWeight.w500,
                  color: AppColors.deliveryCardTextColor,
                ),
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.02),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image
              KCachedNetworkProfileImage(
                imageUrl: "",
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
                btnTitle: "Remove",
                btnBorderColor: AppColors.checkOutColor,
                btnTextColor: AppColors.checkOutColor,
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.02),
        ],
      ),
    );
  }
}
