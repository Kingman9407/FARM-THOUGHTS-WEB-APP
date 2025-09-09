import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../commons/widgets/k_cached_network_profile_image.dart';

class CustomerCard extends StatelessWidget {
  final Map<String, String> customer;
  final VoidCallback? onTap;
  final bool isSelected;

  const CustomerCard({
    super.key,
    required this.customer,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          elevation: 2,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  // Left: profile image + customer info
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        KCachedNetworkProfileImage(
                          imageUrl:
                              customer["imageURL"] ??
                              "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop",
                          height: context.screenWidth * 0.03,
                          width: context.screenWidth * 0.03,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customer["name"] ?? "Unknown",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(customer["phone"] ?? ""),
                            SizedBox(
                              width: 200,
                              child: Text(
                                customer["address"] ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Right: other details in columns
                  Expanded(
                    flex: 2,
                    child: Text(
                      customer["Delivered_by"] ?? "",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      customer["Plan"] ?? "",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      customer["Price"] ?? "",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      customer["Current Bill"] ?? "",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Highlight bar if selected
        if (isSelected)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
