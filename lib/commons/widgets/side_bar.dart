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
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.dashboard, "label": "Dashboard", "route": "/dashboard"},
    {
      "icon": Icons.person,
      "label": "Delivery Agents",
      "route": "/delivery-agents",
    },
    {
      "icon": Icons.local_shipping,
      "label": "Delivery Entries",
      "route": "/entries",
    },
    {
      "icon": Icons.account_balance_wallet,
      "label": "Collection",
      "route": "/collection",
    },
    {"icon": Icons.person, "label": "Customer", "route": "/customers"},
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
    final selectedIndex = _getSelectedIndex(context);

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: context.screenWidth / 8,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset(AppAssets.logo, color: Colors.white),
                const SizedBox(height: 30),
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          color: isSelected
                              ? Colors.white.withOpacity(0.2)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Icon(
                                menuItems[index]["icon"],
                                color: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  menuItems[index]["label"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: KButton(
                    icon: Icons.logout,
                    iconColor: AppColors.primaryColor,
                    text: "Logout",
                    onPressed: () => GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRouterConstants.login),
                    textColor: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.readAppInfoProvider.version != null
                      ? 'V ${context.readAppInfoProvider.version.toString()}'
                      : '',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          // This is where the child route content will be rendered
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
