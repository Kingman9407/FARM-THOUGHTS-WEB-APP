import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveryAgentCard extends StatelessWidget {
  final Map<String, String> agent;
  final VoidCallback? onTap;
  final bool isSelected;
  final String deliveryAgentCardImageUrl;
  final String deliveryAgentName;
  final String deliveryAgentPhoneNumber;
  final String deliveryAgentAddress;
  final String deliveryAgentJoinedAt;
  final String deliveryAgentWorkTime;
  final String deliveryAgentAssignedWith;
  final String deliveryAgentSalary;

  const DeliveryAgentCard({
    super.key,
    required this.agent,
    this.onTap,
    this.isSelected = false,
    required this.deliveryAgentCardImageUrl,
    required this.deliveryAgentName,
    required this.deliveryAgentPhoneNumber,
    required this.deliveryAgentAddress,
    required this.deliveryAgentJoinedAt,
    required this.deliveryAgentWorkTime,
    required this.deliveryAgentAssignedWith,
    required this.deliveryAgentSalary,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(context.screenWidth * 0.004);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.01,
                  vertical: context.screenWidth * 0.005,
                ),
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Delivery Agent Cached Network Image
                          KCachedNetworkProfileImage(
                            imageUrl: deliveryAgentCardImageUrl,
                            height: context.screenWidth * 0.03,
                            width: context.screenWidth * 0.03,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Delivery Agent Name
                                Text(
                                  deliveryAgentName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: context.screenWidth * 0.009,
                                    color: AppColors.titleColor,
                                  ),
                                ),

                                // Delivery Agent Phone Number
                                Text(
                                  deliveryAgentPhoneNumber,
                                  style: TextStyle(
                                    color: AppColors.deliveryCardTextColor,
                                    fontSize: context.screenWidth * 0.008,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                // Delivery Agent Address
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    deliveryAgentAddress,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.deliveryCardTextColor,
                                      fontSize: context.screenWidth * 0.008,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Joined at
                    Expanded(
                      flex: 2,
                      child: Text(
                        deliveryAgentJoinedAt,
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Work time
                    Expanded(
                      flex: 2,
                      child: Text(
                        deliveryAgentWorkTime,
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Assigned with
                    Expanded(
                      flex: 2,
                      child: Text(
                        "$deliveryAgentAssignedWith Customers",
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Salary
                    Expanded(
                      flex: 2,
                      child: Text(
                        "₹ $deliveryAgentSalary.00",
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // left highlight strip when selected
            if (isSelected)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(width: 8, color: AppColors.primaryColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
