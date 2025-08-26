import 'package:farm_thoughts_web_app/commons/widgets/k_cached_network_profile_image.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardTopBar extends StatelessWidget {
  final TextEditingController searchTextEditingController;
  final String userImageUrl;

  const DashboardTopBar({
    super.key,
    required this.searchTextEditingController,
    required this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
          bottom: BorderSide(
            color: AppColors.scaffoldGreyThemeColor,
            width: 0.4,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search For Milk Delivery
          Expanded(
            child: TextFormField(
              controller: searchTextEditingController,
              decoration: InputDecoration(
                hintText: "Search for milk delivery, delivery guys",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.searchHintTextColor,
                  fontSize: context.screenWidth * 0.008,
                ),
                prefixIcon: SvgPicture.asset(
                  AppAssets.searchIcon,
                  color: AppColors.titleColor,
                  width: context.screenWidth * 0.013,
                  height: context.screenWidth * 0.013,
                  fit: BoxFit.contain,
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 40,
                  minHeight: 10,
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          Row(
            spacing: context.screenWidth * 0.015,
            children: [
              // Settings Icon
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppAssets.settingsIcon,
                  height: context.screenWidth * 0.018,
                  width: context.screenWidth * 0.018,
                  color: AppColors.titleColor,
                  fit: BoxFit.cover,
                ),
              ),

              // Notification Icon
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppAssets.notificationIcon,
                  height: context.screenWidth * 0.018,
                  width: context.screenWidth * 0.018,
                  color: AppColors.titleColor,
                  fit: BoxFit.cover,
                ),
              ),

              //  Person Profile Avatar
              KCachedNetworkProfileImage(
                imageUrl: userImageUrl,
                height: context.screenWidth * 0.018,
                width: context.screenWidth * 0.018,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
