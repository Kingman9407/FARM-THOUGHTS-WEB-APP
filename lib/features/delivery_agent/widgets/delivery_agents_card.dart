import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DeliveryAgentCard extends StatelessWidget {
  final Map<String, String> agent;
  final VoidCallback? onTap;
  final bool isSelected;

  const DeliveryAgentCard({
    super.key,
    required this.agent,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Stack(
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            elevation: 2,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade200,
                            child: CachedNetworkImage(
                              imageUrl: agent["imageUrl"]!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  agent["name"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(agent["phone"]!),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    agent["address"]!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Joined at
                    Expanded(
                      flex: 2,
                      child: Text(
                        agent["joined_date"]!,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    // Work time
                    Expanded(
                      flex: 2,
                      child: Text(
                        agent["work_time"]!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    // Assigned with
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${agent["assigned_customers"]} Customers",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    // Salary
                    Expanded(
                      flex: 2,
                      child: Text(
                        "₹ ${agent["salary"]}.00",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// left highlight strip when selected
          if (isSelected)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 8,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
