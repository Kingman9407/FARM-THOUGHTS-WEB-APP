import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:flutter/material.dart';

class DeliveryStatusCard extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final String quantity;
  final String quantityUnit;
  final bool deliveredStatus;
  final String deliveryTime;

  const DeliveryStatusCard({
    super.key,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.quantity,
    required this.quantityUnit,
    required this.deliveredStatus,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Profile Avatar
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: context.screenWidth * 0.005),

            // Main Content
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.012,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 4),

                  // Address
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.008,
                      color: Colors.grey[600],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  SizedBox(height: 4),

                  // Phone Number
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.008,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Right Side Content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Quantity with slash separator
                  Flexible(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: quantity,
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.01,
                              fontWeight: FontWeight.w100,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' / $quantityUnit',
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.006,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Delivery Status
                  Text(
                    deliveredStatus ? 'Delivered' : 'Not Yet',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.008,
                      fontWeight: FontWeight.w600,
                      color: deliveredStatus
                          ? Colors.green[600]
                          : Colors.red[600],
                    ),
                  ),

                  SizedBox(height: 4),

                  // Delivery Time
                  Text(
                    deliveredStatus ? deliveryTime : '',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.006,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
