import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveryEntriesCard extends StatelessWidget {
  final Map<String, String> deliveryEntries;
  final String customerImageUrl;
  final VoidCallback? onTap;
  final bool isSelected;
  final String customerName;
  final String customerPhoneNumber;
  final String customerAddress;
  final String customerTimeStamp;
  final String customerDeliveredLitres;
  final String customerDeliveryPrice;
  final String customerDeliveryPersonImageUrl;
  final String customerDeliveryPersonName;
  final String customerDeliveryPhoneNumber;

  const DeliveryEntriesCard({
    super.key,
    required this.customerName,
    required this.customerPhoneNumber,
    required this.customerAddress,
    required this.customerTimeStamp,
    required this.customerDeliveredLitres,
    required this.customerDeliveryPrice,
    required this.customerDeliveryPersonName,
    required this.customerImageUrl,
    this.onTap,
    required this.isSelected,
    required this.customerDeliveryPhoneNumber,
    required this.customerDeliveryPersonImageUrl,
    required this.deliveryEntries,
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
                            imageUrl: customerImageUrl,
                            height: context.screenWidth * 0.03,
                            width: context.screenWidth * 0.03,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Customer Name
                                Text(
                                  customerName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: context.screenWidth * 0.009,
                                    color: AppColors.titleColor,
                                  ),
                                ),

                                // Customer Phone Number
                                Text(
                                  customerPhoneNumber,
                                  style: TextStyle(
                                    color: AppColors.deliveryCardTextColor,
                                    fontSize: context.screenWidth * 0.008,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                // Customer Address
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    customerAddress,
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

                    // Time Stamp
                    Expanded(
                      flex: 2,
                      child: Text(
                        customerTimeStamp,
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Litres
                    Expanded(
                      flex: 2,
                      child: Text(
                        "$customerDeliveredLitres Litres",
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Price
                    Expanded(
                      flex: 2,
                      child: Text(
                        "₹ $customerDeliveryPrice+",
                        style: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: context.screenWidth * 0.008,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Delivery Person Details
                    Expanded(
                      flex: 2,
                      child: Row(
                        spacing: context.screenWidth * 0.004,
                        children: [
                          // Delivery Person Avatar
                          KCachedNetworkProfileImage(
                            imageUrl: customerDeliveryPersonImageUrl,
                            height: context.screenWidth * 0.025,
                            width: context.screenWidth * 0.025,
                          ),

                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Customer Delivery Person Name
                                Text(
                                  customerDeliveryPersonName,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors.titleColor,
                                    fontSize: context.screenWidth * 0.01,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                // Customer Delivery Person Phone Number
                                Text(
                                  customerDeliveryPhoneNumber,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors
                                        .assignedCustomerCardSubTitleColor,
                                    fontSize: context.screenWidth * 0.009,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
