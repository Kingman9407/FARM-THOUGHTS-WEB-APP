import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/snackbar_extension.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/add_vendor_form.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/view_vendor_details.dart';
import 'package:flutter/material.dart';

class DeliveryAgentDashboard extends StatefulWidget {
  const DeliveryAgentDashboard({super.key});

  @override
  State<DeliveryAgentDashboard> createState() => _DeliveryAgentDashboardState();
}

class _DeliveryAgentDashboardState extends State<DeliveryAgentDashboard> {
  int? selectedRowIndex;
  bool showAddForm = false;
  bool showVendorDetails = false;

  List<Map<String, String>> agents = [
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
  ];

  void _addNewVendor(Map<String, String> vendorData) {
    setState(() {
      agents.add(vendorData);
    });

    context.showSuccessSnackBar("${vendorData['name']} added successfully");
  }

  void _closeForm() {
    setState(() {
      showAddForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            onPressed: () {
                              setState(() {
                                showAddForm = true;
                              });
                            },
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
                            states,
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
                                showVendorDetails = true;
                              } else {
                                selectedRowIndex = null;
                              }
                            });
                            print('Selected vendor: ${agent["name"]}');
                            print(showVendorDetails);
                          },
                          cells: [
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Row(
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
                                                child:
                                                    CircularProgressIndicator(
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
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Text(agent["name"]!),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Text(agent["phone"]!),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Text(agent["price"]!),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Text(agent["pickupTime"]!),
                              ),
                            ),
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
                showAddForm
                    ? AddVendorForm(
                        onClose: _closeForm,
                        onAddVendor: _addNewVendor,
                      )
                    : Container(
                        width: 300,
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 16.0,
                          bottom: 16.0,
                        ),
                        child: const KCalender(),
                      ),
                showVendorDetails ? ViewVendorDetails() : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
