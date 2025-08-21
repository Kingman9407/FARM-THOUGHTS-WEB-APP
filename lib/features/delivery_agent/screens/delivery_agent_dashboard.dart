import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:flutter/material.dart';

class DeliveryAgentDashboard extends StatelessWidget {
  const DeliveryAgentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const DashboardTopBar(),
                  Expanded(
                    child: DataTable2(
                      dividerThickness: 0,
                      columnSpacing: 12,
                      minWidth: 80,
                      columns: [
                        DataColumn2(
                          label: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.add_circle,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 6),
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
                        DataColumn2(
                          label: RichText(
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: "PRICE"),
                                TextSpan(
                                  text: " (PER LTR)",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const DataColumn2(
                          label: Text('PICKUP TIME'),
                          size: ColumnSize.L,
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(
                              Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "http://via.placeholder.com/350x150",
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
                                  const Text("Vendor A"),
                                ],
                              ),
                            ),

                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                          ],
                        ),
                        const DataRow(
                          cells: [
                            DataCell(Text("2")),
                            DataCell(Text("Vendor B")),
                            DataCell(Text("9876543210")),
                            DataCell(Text("₹55")),
                            DataCell(Text("7:30 AM")),
                          ],
                        ),
                        const DataRow(
                          cells: [
                            DataCell(Text("3")),
                            DataCell(Text("Vendor C")),
                            DataCell(Text("9988776655")),
                            DataCell(Text("₹60")),
                            DataCell(Text("8:00 AM")),
                          ],
                        ),
                        const DataRow(
                          cells: [
                            DataCell(Text("4")),
                            DataCell(Text("Vendor D")),
                            DataCell(Text("8899776655")),
                            DataCell(Text("₹48")),
                            DataCell(Text("5:30 AM")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Sidebar
          Container(
            width: 250,
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "View Profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
