import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/collections/screens/collection_dashboard.dart';
import 'package:farm_thoughts_web_app/features/customer/screens/customer_dashboard.dart';
import 'package:farm_thoughts_web_app/features/dashboard/screens/dashboard.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/screens/delivery_agent_dashboard.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/screens/delivery_entries_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    Dashboard(),
    DeliveryAgentDashboard(),
    DeliveryEntriesDashboard(),
    CollectionDashboard(),
    CustomerDashboard(),
  ];

  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.dashboard, "label": "Dashboard"},
    {"icon": Icons.person, "label": "Delivery Agents"},
    {"icon": Icons.local_shipping, "label": "Delivery Entries"},
    {"icon": Icons.account_balance_wallet, "label": "Collection"},
    {"icon": Icons.person, "label": "Customer"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: context.screenWidth / 8,
            color: AppColors.primary,
            child: Column(
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset(AppAssets.logo, color: Colors.white),
                const SizedBox(height: 30),
                ...List.generate(menuItems.length, (index) {
                  final isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      color: isSelected
                          ? Colors.white.withOpacity(0.2)
                          : Colors.transparent,
                      child: Row(
                        children: [
                          Icon(menuItems[index]["icon"], color: Colors.white),
                          const SizedBox(width: 12),
                          Text(
                            menuItems[index]["label"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: KButton(
                    icon: Icons.logout,
                    iconColor: AppColors.primary,
                    text: "Logout",
                    onPressed: () => context.pushReplacementNamed("login"),
                    textColor: AppColors.primary,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: pages[selectedIndex]),
        ],
      ),
    );
  }
}
