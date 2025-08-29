import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/constants/app_router_constants.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatefulWidget {
  final Widget child;

  const SideBar({super.key, required this.child});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  // Menu Items
  final List<Map<String, dynamic>> menuItems = [
    {
      "icon": AppAssets.dashboardIcon,
      "label": "Dashboard",
      "route": "/dashboard",
    },
    {
      "icon": AppAssets.deliveryEntriesIcon,
      "label": "Delivery Agents",
      "route": "/delivery-agents",
    },
    {
      "icon": AppAssets.deliveryGuysIcon,
      "label": "Delivery Entries",
      "route": "/delivery-entries",
    },
    {
      "icon": AppAssets.collectionIcon,
      "label": "Collection",
      "route": "/collection",
    },
    {
      "icon": AppAssets.customerIcon,
      "label": "Customer",
      "route": "/customers",
    },
  ];

  /// Getting the index of the selected route
  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    for (int i = 0; i < menuItems.length; i++) {
      if (location == menuItems[i]["route"]) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    // Selected Index
    final selectedIndex = _getSelectedIndex(context);

    return Scaffold(
      body: Row(
        children: [
          // Side Bar
          Container(
            width: context.screenWidth / 7,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.04),

                // Logo
                SvgPicture.asset(
                  AppAssets.logo,
                  color: AppColors.whiteColor,
                  height: context.screenHeight * 0.09,
                ),

                SizedBox(height: context.screenHeight * 0.04),

                // List of Routes
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedIndex == index;
                      return InkWell(
                        onTap: () {
                          context.go(menuItems[index]["route"]);
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: context.screenHeight * 0.01,
                            horizontal: context.screenWidth * 0.02,
                          ),
                          color: isSelected
                              ? AppColors.whiteColor.withOpacity(0.2)
                              : AppColors.transparentColor,
                          child: Row(
                            children: [
                              // Side Bar Icon
                              SvgPicture.asset(
                                menuItems[index]["icon"],
                                color: AppColors.whiteColor,
                                height: context.screenWidth * 0.012,
                                width: context.screenWidth * 0.012,
                                fit: BoxFit.cover,
                              ),

                              const SizedBox(width: 12),

                              // Side Bar Text
                              Expanded(
                                child: Text(
                                  menuItems[index]["label"],
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: context.screenWidth * 0.0072,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Log Out Btn
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: KButton(
                    svgAssetPath: AppAssets.logOutIcon,
                    iconColor: AppColors.primaryColor,
                    text: "Logout",
                    onPressed: () {
                      // Login
                      GoRouter.of(
                        context,
                      ).pushReplacementNamed(AppRouterConstants.login);
                    },
                    textColor: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                  ),
                ),

                SizedBox(height: context.screenHeight * 0.02),

                // App Version
                Text(
                  context.readAppInfoProvider.version != null
                      ? 'V ${context.readAppInfoProvider.version.toString()}'
                      : '1.0.0',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: context.screenWidth * 0.008,
                  ),
                ),

                SizedBox(height: context.screenHeight * 0.02),
              ],
            ),
          ),

          // Content
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
