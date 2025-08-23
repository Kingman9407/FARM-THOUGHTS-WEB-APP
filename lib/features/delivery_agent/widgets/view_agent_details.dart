import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewAgentDetails extends StatelessWidget {
  final Map<String, dynamic> vendorDetails;
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
              const Spacer(),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
                iconSize: 20,
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
                iconSize: 20,
              ),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Row(children: []),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendorDetails['name'] ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '+91 ${vendorDetails['phone'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 32),

          const Text(
            'Delivery Boy Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            vendorDetails['address'] ?? 'Address not available',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          /// Joined At and Salary section
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Joined at',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      vendorDetails['joined_date'] ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹ ${vendorDetails['salary'] ?? '0'}.00',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          const Text(
            'Assigned Customers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          /// Assigned customer list
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.shade300,
                        child: CachedNetworkImage(
                          imageUrl: "",
                          errorWidget: (context, url, error) => Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.grey.shade600,
                          ),
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
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
