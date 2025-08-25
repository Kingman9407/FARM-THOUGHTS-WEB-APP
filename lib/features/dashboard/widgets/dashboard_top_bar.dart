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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
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
                prefixIcon: SvgPicture.asset(
                  AppAssets.searchIcon,
                  color: AppColors.titleColor,
                  width: context.screenWidth * 0.010,
                  height: context.screenWidth * 0.010,
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
                  height: context.screenWidth * 0.012,
                  width: context.screenWidth * 0.012,
                  color: AppColors.titleColor,
                  fit: BoxFit.cover,
                ),
              ),

              // Notification Icon
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppAssets.notificationIcon,
                  height: context.screenWidth * 0.012,
                  width: context.screenWidth * 0.012,
                  color: AppColors.titleColor,
                  fit: BoxFit.cover,
                ),
              ),

              //  Person
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[200],
                child: ClipOval(
                  child: Image.network(
                    userImageUrl,
                    fit: BoxFit.cover,
                    width: 18,
                    height: 18,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.person,
                          size: context.screenWidth * 0.02,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
