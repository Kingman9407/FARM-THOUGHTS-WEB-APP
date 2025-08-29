import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  final String name;
  final String phone;
  final String litres;
  final String imageUrl;

  const DeliveryCard({
    super.key,
    required this.name,
    required this.phone,
    required this.litres,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.012,
        // a little more space left/right
        vertical: context.screenHeight * 0.006, // reduced vertical padding
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(context.screenWidth * 0.008),
      ),
      child: Row(
        children: [
          KCachedNetworkProfileImage(
            imageUrl: imageUrl,
            height: context.screenWidth * 0.035,
            width: context.screenWidth * 0.035,
          ),

          SizedBox(width: context.screenWidth * 0.01),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: context.screenWidth * 0.012,
                    color: AppColors.titleColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: context.screenHeight * 0.002),
                Text(
                  phone,
                  style: TextStyle(
                    color: AppColors.deliveryCardTextColor,
                    fontSize: context.screenWidth * 0.010,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LITRE",
                style: TextStyle(
                  color: AppColors.deliveryCardTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: context.screenWidth * 0.010,
                ),
              ),
              Text(
                litres,
                style: TextStyle(
                  color: AppColors.checkOutColor,
                  fontSize: context.screenWidth * 0.012,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
