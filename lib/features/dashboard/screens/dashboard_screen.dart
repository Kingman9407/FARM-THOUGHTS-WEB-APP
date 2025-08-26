import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_statistics_card.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/delivery_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Controllers
  final TextEditingController dashboardSearchController =
      TextEditingController();

  // User Image Url
  final String imageUrl =
      "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  void dispose() {
    dashboardSearchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldGreyThemeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // DashBoard Top Bar (Search)
          DashboardTopBar(
            searchTextEditingController: dashboardSearchController,
            userImageUrl: imageUrl,
          ),

          Expanded(
            child: Row(
              children: [
                // Main Content
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.01,
                      vertical: context.screenHeight * 0.001,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.screenHeight * 0.04),

                        // Statistics
                        Text(
                          "Statistics",
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.013,
                            fontWeight: FontWeight.w700,
                            color: AppColors.titleColor,
                          ),
                        ),

                        SizedBox(height: context.screenHeight * 0.02),

                        // Statistics card
                        Row(
                          spacing: context.screenWidth * 0.02,
                          children: [
                            Expanded(
                              child: KStatisticsCard(
                                backgroundAsset: AppAssets.orangeVector,
                                iconAsset: AppAssets.totalMilkDeliveredIcon,
                                title: 'Total Milk Delivered',
                                value: '₹30,000',
                              ),
                            ),
                            Expanded(
                              child: KStatisticsCard(
                                backgroundAsset: AppAssets.greenVector,
                                iconAsset: AppAssets.totalMoneyEarnedIcon,
                                title: 'Total Money Earned',
                                value: '₹50,000',
                              ),
                            ),
                            Expanded(
                              child: KStatisticsCard(
                                backgroundAsset: AppAssets.blueVector,
                                iconAsset: AppAssets.totalMilkRequiredIcon,
                                title: 'Total Litre Required',
                                value: '120 L',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: context.screenHeight * 0.02),

                        Text(
                          "Delivered By",
                          style: TextStyle(
                            fontSize: context.screenWidth * 0.013,
                            fontWeight: FontWeight.w700,
                            color: AppColors.titleColor,
                          ),
                        ),

                        SizedBox(height: context.screenHeight * 0.02),

                        // Content
                        Expanded(
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: context.screenWidth / 2,
                                  // ✅ 2 per row
                                  crossAxisSpacing: context.screenWidth * 0.01,
                                  mainAxisSpacing: context.screenHeight * 0.01,
                                  mainAxisExtent: context.screenHeight / 7,
                                ),

                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return DeliveryCard(
                                name: "John Doe $index",
                                phone: "987654321$index",
                                litres: "${index + 5} L",
                                imageUrl: imageUrl,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Calendar Content
                Expanded(
                  flex: 1,
                  child: ColoredBox(
                    color: AppColors.whiteColor,
                    child: KCalender(),
                  ),
                ), // ✅ works fine
              ],
            ),
          ),
        ],
      ),
    );
  }
}
