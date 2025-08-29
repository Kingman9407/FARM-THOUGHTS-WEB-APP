import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewDeliveryEntriesDetails extends StatelessWidget {
  final VoidCallback onArrowBackOnTap;
  final VoidCallback onEditOnTap;
  final VoidCallback onDeleteOnTap;

  const ViewDeliveryEntriesDetails({
    super.key,
    required this.onArrowBackOnTap,
    required this.onEditOnTap,
    required this.onDeleteOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
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
                    onArrowBackOnTap();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.deliveryCardTextColor,
                  ),
                ),
              ),

              const Spacer(),

              // Edit Icon
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    onEditOnTap();
                  },
                  child: SvgPicture.asset(
                    AppAssets.editIcon,
                    color: AppColors.primaryColor,
                    height: context.screenWidth * 0.014,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: context.screenWidth * 0.02),

              // Delete Icon
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    onDeleteOnTap();
                  },
                  child: SvgPicture.asset(
                    AppAssets.deleteIcon,
                    color: AppColors.primaryColor,
                    height: context.screenWidth * 0.014,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: context.screenWidth * 0.02),

          Row(
            children: [
              // Image
              KCachedNetworkProfileImage(
                imageUrl: "",
                //imageUrl: vendorDetails["imageUrl"]!,
                height: context.screenWidth * 0.04,
                width: context.screenWidth * 0.04,
              ),

              SizedBox(width: context.screenWidth * 0.01),

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
            ],
          ),

          SizedBox(height: context.screenHeight * 0.04),

          // Delivery Boy Details
          Text(
            'Delivery Boy Details',
            style: TextStyle(
              fontSize: context.screenWidth * 0.01,
              fontWeight: FontWeight.w600,
              color: AppColors.titleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Delivery Address
          Text(
            textAlign: TextAlign.start,
            softWrap: true,
            "5, Saram, Thendral Nagar, Puducherry",
            // vendorDetails['address'] ?? 'Address not available',
            style: TextStyle(
              fontSize: context.screenWidth * 0.009,
              fontWeight: FontWeight.w400,
              color: AppColors.assignedCustomerCardSubTitleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.04),

          // Litre Delivered and Price
          Row(
            children: [
              Expanded(
                child: Column(
                  spacing: context.screenHeight * 0.002,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Litre Delivered
                    Text(
                      'Litre Delivered',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.009,
                        fontWeight: FontWeight.w400,
                        color: AppColors.assignedCustomerCardSubTitleColor,
                      ),
                    ),

                    // Joined At Date
                    Text(
                      "20L",
                      // vendorDetails['joined_date'] ?? 'N/A',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.009,
                        fontWeight: FontWeight.w600,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  spacing: context.screenHeight * 0.002,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Salary
                    Text(
                      'Salary',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.009,
                        fontWeight: FontWeight.w400,
                        color: AppColors.assignedCustomerCardSubTitleColor,
                      ),
                    ),

                    // Vendor Salary
                    Text(
                      "₹ 50.00",
                      // '₹ ${vendorDetails['salary'] ?? '0'}.00',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.009,
                        fontWeight: FontWeight.w600,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Time Stamp
          Column(
            spacing: context.screenHeight * 0.002,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TimeStamp
              Text(
                "TimeStamp",
                style: TextStyle(
                  fontSize: context.screenWidth * 0.009,
                  fontWeight: FontWeight.w400,
                  color: AppColors.assignedCustomerCardSubTitleColor,
                ),
              ),

              // TimeStamp Data
              Text(
                "8, Jan 2023, 10:30",
                // vendorDetails['joined_date'] ?? 'N/A',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.009,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleColor,
                ),
              ),
            ],
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Delivered By
          Text(
            'Delivery By',
            style: TextStyle(
              fontSize: context.screenWidth * 0.01,
              fontWeight: FontWeight.w600,
              color: AppColors.titleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.02),

          // Delivery Person Details
          Row(
            children: [
              // Image
              KCachedNetworkProfileImage(
                imageUrl: "",
                //imageUrl: vendorDetails["imageUrl"]!,
                height: context.screenWidth * 0.04,
                width: context.screenWidth * 0.04,
              ),

              SizedBox(width: context.screenWidth * 0.01),

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
            ],
          ),
        ],
      ),
    );
  }
}
