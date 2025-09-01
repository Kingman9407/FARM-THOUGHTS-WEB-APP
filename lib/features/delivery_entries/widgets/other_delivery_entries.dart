import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OtherDeliveryEntries extends StatelessWidget {
  final VoidCallback onArrowBackTap;
  final VoidCallback onSubmitTap;

  const OtherDeliveryEntries({
    super.key,
    required this.onArrowBackTap,
    required this.onSubmitTap,
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
                text: "Submit",
                onPressed: () {
                  onSubmitTap();
                },
                backgroundColor: AppColors.primaryColor,
                borderRadius: context.screenWidth * 0.002,
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.04),

          // Other Details
          Text(
            'Other Details',
            style: TextStyle(
              fontSize: context.screenWidth * 0.01,
              fontWeight: FontWeight.w700,
              color: AppColors.titleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Litre Delivered
          KTextFormField(
            label: "Litre Delivered*",
            name: "Litre Delivered",
            hintText: "1 Litre",
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Litre Delivered
          KTextFormField(
            label: "Litre Price*",
            name: "Litre Delivered",
            hintText: "₹5,000",
          ),
        ],
      ),
    );
  }
}
