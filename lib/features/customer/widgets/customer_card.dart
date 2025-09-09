import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade200,
                                child: CachedNetworkImage(
                                  imageUrl: customer['imageURL']!,
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
                              SizedBox(width: 10),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    customer["name"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(customer["phone"]!),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      customer["address"]!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            customer["Delivered_by"]!,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            customer["Plan"]!,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            customer["Price"]!,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            customer["Current Bill"]!,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
