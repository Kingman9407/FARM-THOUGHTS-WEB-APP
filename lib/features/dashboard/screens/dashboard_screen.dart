import 'package:farm_thoughts_web_app/commons/widgets/k_statistics_card.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
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

  @override
  void dispose() {
    dashboardSearchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DashBoard Top Bar (Search)
            DashboardTopBar(
              searchTextEditingController: dashboardSearchController,
              userImageUrl: "",
            ),

            const SizedBox(height: 24),

            Text(
              "Statistics",
              style: TextStyle(
                fontSize: context.header,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: KStatisticsCard(
                    backgroundAsset: AppAssets.orangeVector,
                    iconAsset: AppAssets.milkBottle,
                    title: 'Total Milk Delivered',
                    value: '₹30,000',
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: KStatisticsCard(
                    backgroundAsset: AppAssets.greenVector,
                    iconAsset: AppAssets.wallet,
                    title: 'Total Money Earned',
                    value: '₹50,000',
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: KStatisticsCard(
                    backgroundAsset: AppAssets.blueVector,
                    iconAsset: AppAssets.milkCup,
                    title: 'Total Litre Required',
                    value: '120 L',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Delivered By Section
            Text(
              "Delivered By",
              style: TextStyle(
                fontSize: context.header,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: context.screenHeight / 7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 6,
                    maxCrossAxisExtent: context.screenWidth / 3.5,
                  ),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return DeliveryCard(
                      name: "John Doe $index",
                      phone: "987654321$index",
                      litres: "${index + 5} L",
                      imageUrl:
                          "https://i.pinimg.com/736x/e8/3b/0b/e83b0b9e73d55d9308064514ad2eea76.jpg",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
