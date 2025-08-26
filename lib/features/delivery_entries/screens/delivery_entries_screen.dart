import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/snackbar_extension.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/add_agent_form.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/providers/delivery_entries_provider.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/widgets/add_delivery_agents_entries.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/widgets/delivery_entries_card.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/widgets/edit_delivery_entries.dart';
import 'package:farm_thoughts_web_app/features/delivery_entries/widgets/view_delivery_entries_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DeliveryEntriesScreen extends StatefulWidget {
  const DeliveryEntriesScreen({super.key});

  @override
  State<DeliveryEntriesScreen> createState() => _DeliveryEntriesScreenState();
}

class _DeliveryEntriesScreenState extends State<DeliveryEntriesScreen> {
  // Agents
  final List<Map<String, String>> customerDeliveries = [
    {
      "customerName": "Arjun Mehta",
      "customerPhoneNumber": "9876543210",
      "customerAddress": "12, MG Road, Bengaluru",
      "customerTimeStamp": "26 Aug 2025, 10:30 AM",
      "customerDeliveredLitres": "-1",
      "customerDeliveryPrice": "20",
      "customerDeliveryPersonName": "Ravi Kumar",
      "customerImageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "customerDeliveryPhoneNumber": "9876500001",
      "customerDeliveryPersonImageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "customerName": "Sneha Iyer",
      "customerPhoneNumber": "9123456789",
      "customerAddress": "24, Anna Salai, Chennai",
      "customerTimeStamp": "26 Aug 2025, 11:15 AM",
      "customerDeliveredLitres": "3",
      "customerDeliveryPrice": "150",
      "customerDeliveryPersonName": "Karthik N",
      "customerImageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "customerDeliveryPhoneNumber": "9876500001",
      "customerDeliveryPersonImageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "customerName": "Rahul Sharma",
      "customerPhoneNumber": "9988776655",
      "customerAddress": "7, Park Street, Kolkata",
      "customerTimeStamp": "26 Aug 2025, 09:50 AM",
      "customerDeliveredLitres": "7",
      "customerDeliveryPrice": "350",
      "customerDeliveryPersonName": "Mohammed Ali",
      "customerImageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "customerDeliveryPhoneNumber": "9876500001",
      "customerDeliveryPersonImageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "customerName": "Priya Verma",
      "customerPhoneNumber": "9012345678",
      "customerAddress": "45, Sector 18, Noida",
      "customerTimeStamp": "26 Aug 2025, 12:05 PM",
      "customerDeliveredLitres": "2",
      "customerDeliveryPrice": "100",
      "customerDeliveryPersonName": "Ankit Yadav",
      "customerImageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "customerDeliveryPhoneNumber": "9876500001",
      "customerDeliveryPersonImageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "customerName": "Vikram Singh",
      "customerPhoneNumber": "9090909090",
      "customerAddress": "89, Charminar Rd, Hyderabad",
      "customerTimeStamp": "26 Aug 2025, 01:20 PM",
      "customerDeliveredLitres": "10",
      "customerDeliveryPrice": "500",
      "customerDeliveryPersonName": "Sandeep R",
      "customerImageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "customerDeliveryPhoneNumber": "9876500001",
      "customerDeliveryPersonImageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
  ];

  // Controllers
  final TextEditingController deliverySearchController =
      TextEditingController();

  @override
  void dispose() {
    deliverySearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldGreyThemeColor,

      body: Column(
        children: [
          // Search Top Bar
          DashboardTopBar(
            searchTextEditingController: deliverySearchController,
            userImageUrl:
                "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),

          Expanded(
            child: Row(
              children: [
                // Main Content
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.01,
                      vertical: context.screenHeight * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              // Add New
                              Expanded(
                                flex: 2,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Add Enabled Functionality
                                      context.readDeliveryAgentsProvider
                                          .setAddedEnabled(true);
                                    },
                                    child: Row(
                                      spacing: context.screenWidth * 0.002,
                                      children: [
                                        // Add Icon
                                        SvgPicture.asset(
                                          AppAssets.addCircleIcon,
                                          height: context.screenWidth * 0.009,
                                          fit: BoxFit.cover,
                                        ),

                                        // Add Text
                                        Text(
                                          "Add new",
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // CUSTOMER
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "CUSTOMER",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // TIMESTAMP
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "TIMESTAMP",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // LITRE
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "LITRE",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // PRICE
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "PRICE",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // DELIVERED BY
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "DELIVERED BY",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // List of Delivery Agents
                        Expanded(
                          child: ListView.builder(
                            itemCount: customerDeliveries.length,
                            itemBuilder: (context, index) {
                              final delivery = customerDeliveries[index];

                              return DeliveryEntriesCard(
                                deliveryEntries: delivery,
                                onTap: () {
                                  // Select Delivery Entries
                                  context.readDeliveryEntriesProvider
                                      .setSelectedEntries(delivery);

                                  // Read Delivery Entries
                                  context.readDeliveryEntriesProvider
                                      .setViewEntriesDetailsEnabled(true);
                                },
                                customerName: delivery["customerName"] ?? "",
                                customerPhoneNumber:
                                    delivery["customerPhoneNumber"] ?? "",
                                customerAddress:
                                    delivery["customerAddress"] ?? "",
                                customerTimeStamp:
                                    delivery["customerTimeStamp"] ?? "",
                                customerDeliveredLitres:
                                    delivery["customerDeliveredLitres"] ?? "",
                                customerDeliveryPrice:
                                    delivery["customerDeliveryPrice"] ?? "",
                                customerDeliveryPersonName:
                                    delivery["customerDeliveryPersonName"] ??
                                    "",
                                customerImageUrl:
                                    delivery["customerImageUrl"] ?? "",
                                isSelected:
                                    context
                                        .watchDeliveryEntriesProvider
                                        .selectedEntries ==
                                    delivery,
                                customerDeliveryPhoneNumber:
                                    delivery["customerDeliveryPhoneNumber"] ??
                                    "",
                                customerDeliveryPersonImageUrl:
                                    delivery["customerDeliveryPersonImageUrl"] ??
                                    "",
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Calendar Content
                Expanded(
                  flex: 1,
                  child: Consumer<DeliveryEntriesProvider>(
                    builder: (context, deliveryEntriesProvider, child) {
                      if (deliveryEntriesProvider.isAddedEnabled) {
                        return AddAgentForm(
                          onClose: () => context.readDeliveryEntriesProvider
                              .resetAllEntries(),
                          onAddVendor: (Map<String, String> data) {
                            // Add Customer Deliver
                            customerDeliveries.add(data);

                            // Reset All Entries
                            context.readDeliveryEntriesProvider
                                .resetAllEntries();

                            // Success Snack Bar
                            context.showSuccessSnackBar(
                              "${data['name']} has been added successfully",
                            );
                          },
                        );
                      } else if (deliveryEntriesProvider.isViewDetailsEnabled) {
                        return ViewDeliveryEntriesDetails(
                          onArrowBackOnTap: () {
                            // Reset All Entries
                            context.readDeliveryEntriesProvider
                                .resetAllEntries();
                          },
                          onEditOnTap: () {
                            // Set Edit Enabled
                            context.readDeliveryEntriesProvider
                                .setEditEntriesEnabled(true);
                          },
                          onDeleteOnTap: () {},
                        );
                      } else if (deliveryEntriesProvider.isEditEnabled) {
                        return EditDeliveryEntries(
                          onArrowBackTap: () {},
                          onNextTap: () {
                            // Set Delivered Agents Added
                            context.readDeliveryEntriesProvider
                                .setDeliveredAgentsAdded(true);
                          },
                        );
                      } else if (deliveryEntriesProvider
                          .isDeliveredAgentsAdded) {
                        return AddDeliveryAgentsEntries();
                      } else {
                        return ColoredBox(
                          color: AppColors.whiteColor,
                          child: KCalender(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
