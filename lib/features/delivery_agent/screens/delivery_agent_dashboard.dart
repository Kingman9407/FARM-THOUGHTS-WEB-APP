import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:flutter/material.dart';

class DeliveryAgentDashboard extends StatefulWidget {
  const DeliveryAgentDashboard({super.key});

  @override
  State<DeliveryAgentDashboard> createState() => _DeliveryAgentDashboardState();
}

class _DeliveryAgentDashboardState extends State<DeliveryAgentDashboard> {
  int? selectedRowIndex;

  @override
  Widget build(BuildContext context) {
    final agents = [
      {
        "name": "Vendor A",
        "phone": "9876543210",
        "price": "₹50",
        "pickupTime": "6:30 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor B",
        "phone": "9123456780",
        "price": "₹55",
        "pickupTime": "7:00 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor C",
        "phone": "9988776655",
        "price": "₹60",
        "pickupTime": "7:30 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor D",
        "phone": "8899776655",
        "price": "₹48",
        "pickupTime": "8:00 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor E",
        "phone": "7766554433",
        "price": "₹52",
        "pickupTime": "8:15 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor F",
        "phone": "9090909090",
        "price": "₹58",
        "pickupTime": "8:30 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor G",
        "phone": "9123412341",
        "price": "₹54",
        "pickupTime": "8:45 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor H",
        "phone": "9345678901",
        "price": "₹62",
        "pickupTime": "9:00 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor I",
        "phone": "9786543210",
        "price": "₹59",
        "pickupTime": "9:15 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor J",
        "phone": "9123987654",
        "price": "₹57",
        "pickupTime": "9:30 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor K",
        "phone": "9345612345",
        "price": "₹61",
        "pickupTime": "9:45 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor L",
        "phone": "9456123456",
        "price": "₹63",
        "pickupTime": "10:00 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor M",
        "phone": "9567890123",
        "price": "₹49",
        "pickupTime": "10:15 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor N",
        "phone": "9678901234",
        "price": "₹53",
        "pickupTime": "10:30 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor O",
        "phone": "9789012345",
        "price": "₹56",
        "pickupTime": "10:45 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor P",
        "phone": "9890123456",
        "price": "₹64",
        "pickupTime": "11:00 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor Q",
        "phone": "9901234567",
        "price": "₹51",
        "pickupTime": "11:15 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor R",
        "phone": "9012345678",
        "price": "₹65",
        "pickupTime": "11:30 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor S",
        "phone": "9123456709",
        "price": "₹47",
        "pickupTime": "11:45 AM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
      {
        "name": "Vendor T",
        "phone": "9234567890",
        "price": "₹66",
        "pickupTime": "12:00 PM",
        "imageUrl": "http://via.placeholder.com/350x150",
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          // Top bar spans full width
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: DashboardTopBar(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 8.0,
                      bottom: 16.0,
                    ),
                    child: DataTable2(
                      dividerThickness: 0,
                      dataRowHeight: 70,

                      columnSpacing: 12,
                      minWidth: 80,
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn2(
                          label: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Add new",
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ],
                            ),
                          ),
                          size: ColumnSize.L,
                        ),
                        const DataColumn2(
                          label: Text('VENDOR NAME'),
                          size: ColumnSize.L,
                        ),
                        const DataColumn2(
                          label: Text('PHONE NUMBER'),
                          size: ColumnSize.L,
                        ),
                        const DataColumn2(
                          label: Text('PRICE (PER LTR)'),
                          size: ColumnSize.L,
                        ),
                        const DataColumn2(
                          label: Text('PICKUP TIME'),
                          size: ColumnSize.L,
                        ),
                      ],
                      rows: agents.asMap().entries.map((entry) {
                        final index = entry.key;
                        final agent = entry.value;
                        final isSelected = selectedRowIndex == index;

                        return DataRow(
                          selected: isSelected,
                          color: WidgetStateProperty.resolveWith<Color?>((
                            Set<WidgetState> states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return AppColors.primary.withValues(alpha: 0.2);
                            }
                            return null;
                          }),

                          onSelectChanged: (selected) {
                            setState(() {
                              if (selected!) {
                                selectedRowIndex = index;
                              } else {
                                selectedRowIndex = null;
                              }
                            });
                            print('Selected vendor: ${agent["name"]}');
                          },
                          cells: [
                            DataCell(
                              Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CachedNetworkImage(
                                        imageUrl: agent["imageUrl"]!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const Center(
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                              Icons.person,
                                              size: 40,
                                              color: Colors.grey,
                                            ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(agent["name"]!),
                                ],
                              ),
                            ),
                            DataCell(Text(agent["name"]!)),
                            DataCell(Text(agent["phone"]!)),
                            DataCell(Text(agent["price"]!)),
                            DataCell(Text(agent["pickupTime"]!)),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
                Container(
                  width: 300,
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16.0,
                    bottom: 16.0,
                  ),
                  child: const KCalender(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
