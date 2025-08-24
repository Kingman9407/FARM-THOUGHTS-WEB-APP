import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:flutter/material.dart';

class ViewAgentDetails extends StatelessWidget {
  final Map<String, String> vendorDetails;
  const ViewAgentDetails({super.key, required this.vendorDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.readDeliveryAgentsProvider.resetAll();
                },
                icon: Icon(Icons.arrow_back),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  context.readDeliveryAgentsProvider.setEditEnabled(true);
                },
                iconSize: 20,
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  AppLoggerHelper.logResponse(vendorDetails.values);
                },
                iconSize: 20,
              ),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade200,
                child: CachedNetworkImage(
                  imageUrl: vendorDetails["imageUrl"]!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(strokeWidth: 2),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.person, size: 30, color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendorDetails['name'] ?? 'N/A',
                    style: TextStyle(
                      fontSize: context.title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '+91 ${vendorDetails['phone'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: context.bodyText,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          Text(
            'Delivery Boy Details',
            style: TextStyle(
              fontSize: context.subtitle,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            vendorDetails['address'] ?? 'Address not available',
            style: TextStyle(
              fontSize: context.bodyText,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // Joined At and Salary section
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joined at',
                      style: TextStyle(
                        fontSize: context.bodyText,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      vendorDetails['joined_date'] ?? 'N/A',
                      style: TextStyle(
                        fontSize: context.subtitle,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salary',
                      style: TextStyle(
                        fontSize: context.bodyText,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹ ${vendorDetails['salary'] ?? '0'}.00',
                      style: TextStyle(
                        fontSize: context.subtitle,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Work time section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Work time',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 4),
              Text(
                vendorDetails['work_time'] ?? 'N/A',
                style: TextStyle(
                  fontSize: context.subtitle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Text(
            'Assigned Customers',
            style: TextStyle(
              fontSize: context.subtitle,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://i.pinimg.com/736x/c0/44/25/c04425f45f3ca3dbc120c40a596816d9.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.person, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'N Saravanan',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '5, Gandhi St, Nehru Nagar,...',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '- 0.75L',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
