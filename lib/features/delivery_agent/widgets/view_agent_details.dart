import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewAgentDetails extends StatelessWidget {
  final Map<String, String> vendorDetails;

  const ViewAgentDetails({super.key, required this.vendorDetails});

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
                    context.readDeliveryAgentsProvider.resetAll();
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
                    context.readDeliveryAgentsProvider.setEditEnabled(true);
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
                    AppLoggerHelper.logResponse(vendorDetails.values);
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
                imageUrl: vendorDetails["imageUrl"]!,
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
                    vendorDetails['name'] ?? 'N/A',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.01,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleColor,
                    ),
                  ),

                  // Phone Number
                  Text(
                    '+91 ${vendorDetails['phone'] ?? 'N/A'}',
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

          // Vendor Address
          Text(
            vendorDetails['address'] ?? 'Address not available',
            style: TextStyle(
              fontSize: context.screenWidth * 0.009,
              fontWeight: FontWeight.w400,
              color: AppColors.assignedCustomerCardSubTitleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.04),

          // Joined At and Salary section
          Row(
            children: [
              Expanded(
                child: Column(
                  spacing: context.screenHeight * 0.002,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Joined At
                    Text(
                      'Joined at',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.009,
                        fontWeight: FontWeight.w400,
                        color: AppColors.assignedCustomerCardSubTitleColor,
                      ),
                    ),

                    // Joined At Date
                    Text(
                      vendorDetails['joined_date'] ?? 'N/A',
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
                      '₹ ${vendorDetails['salary'] ?? '0'}.00',
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

          SizedBox(height: context.screenWidth * 0.02),

          // Work time section
          Column(
            spacing: context.screenHeight * 0.002,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Work Time
              Text(
                'Work time',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.009,
                  fontWeight: FontWeight.w400,
                  color: AppColors.assignedCustomerCardSubTitleColor,
                ),
              ),

              // Work Time Text
              Text(
                vendorDetails['work_time'] ?? 'N/A',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.009,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleColor,
                ),
              ),
            ],
          ),

          SizedBox(height: context.screenWidth * 0.02),

          Text(
            'Assigned Customers',
            style: TextStyle(
              fontSize: context.screenWidth * 0.01,
              fontWeight: FontWeight.w700,
              color: AppColors.titleColor,
            ),
          ),

          SizedBox(height: context.screenHeight * 0.01),

          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    spacing: context.screenWidth * 0.008,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image
                      KCachedNetworkProfileImage(
                        imageUrl:
                            "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        height: context.screenWidth * 0.03,
                        width: context.screenWidth * 0.03,
                      ),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Name
                                Text(
                                  'N Saravanan',
                                  style: TextStyle(
                                    fontSize: context.screenWidth * 0.01,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.titleColor,
                                  ),
                                ),

                                // Litres
                                Text(
                                  ' - 0.75L',
                                  style: TextStyle(
                                    fontSize: context.screenWidth * 0.01,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors
                                        .assignedCustomerCardSubTitleColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '5, Gandhi St, Nehru Nagar,...',
                              style: TextStyle(
                                fontSize: context.screenWidth * 0.008,
                                fontWeight: FontWeight.w400,
                                color:
                                    AppColors.assignedCustomerCardSubTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
