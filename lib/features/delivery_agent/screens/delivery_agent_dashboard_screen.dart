import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/snackbar_extension.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/provider/delivery_agents_provider.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/add_agent_form.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/assign_customer_widget.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/delivery_agents_card.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/view_agent_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DeliveryAgentDashboardScreen extends StatefulWidget {
  const DeliveryAgentDashboardScreen({super.key});

  @override
  State<DeliveryAgentDashboardScreen> createState() =>
      _DeliveryAgentDashboardScreenState();
}

class _DeliveryAgentDashboardScreenState
    extends State<DeliveryAgentDashboardScreen> {
  // Agents
  final List<Map<String, String>> agents = [
    {
      "id": "1",
      "name": "Muhammed Tariq",
      "phone": "6325874196",
      "address": "5, Gandhi St, Nehru Nagar, Muthialur",
      "salary": "5000",
      "work_time": "9 am - 10 pm",
      "assigned_customers": "48",
      "joined_date": "08,Nov,2022",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "2",
      "name": "Priya Sharma",
      "phone": "9123456780",
      "address": "456 Market Road, Commercial Street",
      "salary": "17000",
      "work_time": "7:00 AM - 3:00 PM",
      "assigned_customers": "32",
      "joined_date": "15,Jul,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "3",
      "name": "Rajesh Kumar",
      "phone": "8765432109",
      "address": "12, Anna Salai, T. Nagar, Chennai",
      "salary": "8500",
      "work_time": "8:00 AM - 5:00 PM",
      "assigned_customers": "25",
      "joined_date": "22,Mar,2024",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "4",
      "name": "Sneha Patel",
      "phone": "7890123456",
      "address": "78, MG Road, Banashankari, Bangalore",
      "salary": "12000",
      "work_time": "10:00 AM - 7:00 PM",
      "assigned_customers": "18",
      "joined_date": "05,Jan,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "5",
      "name": "Arjun Reddy",
      "phone": "9876543210",
      "address": "34, Jubilee Hills, Hyderabad",
      "salary": "15000",
      "work_time": "6:00 AM - 2:00 PM",
      "assigned_customers": "42",
      "joined_date": "18,Sep,2022",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "6",
      "name": "Kavya Nair",
      "phone": "6543210987",
      "address": "89, Marine Drive, Fort Kochi",
      "salary": "9500",
      "work_time": "9:00 AM - 6:00 PM",
      "assigned_customers": "28",
      "joined_date": "12,Dec,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "7",
      "name": "Vikram Singh",
      "phone": "5432109876",
      "address": "156, Connaught Place, New Delhi",
      "salary": "18000",
      "work_time": "8:30 AM - 5:30 PM",
      "assigned_customers": "35",
      "joined_date": "03,Jun,2024",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "8",
      "name": "Anita Desai",
      "phone": "4321098765",
      "address": "67, Park Street, Kolkata",
      "salary": "11000",
      "work_time": "7:30 AM - 4:30 PM",
      "assigned_customers": "22",
      "joined_date": "28,Feb,2023",
      "imageUrl":
          "https://i.pinimg.com/736x/c0/44/25/c04425f45f3ca3dbc120c40a596816d9.jpg",
    },
    {
      "id": "9",
      "name": "Suresh Babu",
      "phone": "3210987654",
      "address": "23, Residency Road, Bangalore",
      "salary": "7500",
      "work_time": "10:00 AM - 8:00 PM",
      "assigned_customers": "15",
      "joined_date": "14,Oct,2024",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "10",
      "name": "Meera Joshi",
      "phone": "2109876543",
      "address": "45, Carter Road, Bandra, Mumbai",
      "salary": "13500",
      "work_time": "9:00 AM - 6:00 PM",
      "assigned_customers": "38",
      "joined_date": "07,May,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "11",
      "name": "Karthik Menon",
      "phone": "1098765432",
      "address": "91, Brigade Road, Bangalore",
      "salary": "10500",
      "work_time": "8:00 AM - 5:00 PM",
      "assigned_customers": "27",
      "joined_date": "19,Aug,2022",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "12",
      "name": "Deepika Rao",
      "phone": "0987654321",
      "address": "112, Linking Road, Mumbai",
      "salary": "16000",
      "work_time": "10:30 AM - 7:30 PM",
      "assigned_customers": "44",
      "joined_date": "26,Apr,2024",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "13",
      "name": "Rohit Gupta",
      "phone": "9876543211",
      "address": "58, CP Tank, Mumbai",
      "salary": "6500",
      "work_time": "6:30 AM - 1:30 PM",
      "assigned_customers": "19",
      "joined_date": "11,Jan,2024",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "14",
      "name": "Lakshmi Iyer",
      "phone": "8765432112",
      "address": "73, Mylapore, Chennai",
      "salary": "9000",
      "work_time": "9:30 AM - 6:30 PM",
      "assigned_customers": "31",
      "joined_date": "02,Nov,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "15",
      "name": "Ashwin Das",
      "phone": "7654321123",
      "address": "25, Kaloor, Ernakulam, Kochi",
      "salary": "14000",
      "work_time": "7:00 AM - 4:00 PM",
      "assigned_customers": "36",
      "joined_date": "16,Dec,2022",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "16",
      "name": "Pooja Malik",
      "phone": "6543211234",
      "address": "87, Sector 17, Chandigarh",
      "salary": "11500",
      "work_time": "8:00 AM - 6:00 PM",
      "assigned_customers": "23",
      "joined_date": "09,Sep,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "17",
      "name": "Naveen Kumar",
      "phone": "5432112345",
      "address": "134, Banjara Hills, Hyderabad",
      "salary": "8000",
      "work_time": "10:00 AM - 9:00 PM",
      "assigned_customers": "29",
      "joined_date": "21,Jun,2024",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "18",
      "name": "Riya Kapoor",
      "phone": "4321123456",
      "address": "46, Vasant Kunj, New Delhi",
      "salary": "19000",
      "work_time": "9:00 AM - 5:00 PM",
      "assigned_customers": "41",
      "joined_date": "13,Mar,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "19",
      "name": "Sanjay Patil",
      "phone": "3211234567",
      "address": "62, FC Road, Pune",
      "salary": "12500",
      "work_time": "8:30 AM - 5:30 PM",
      "assigned_customers": "33",
      "joined_date": "30,Aug,2022",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "id": "20",
      "name": "Divya Pillai",
      "phone": "2112345678",
      "address": "99, Vellayambalam, Thiruvananthapuram",
      "salary": "10000",
      "work_time": "7:00 AM - 3:00 PM",
      "assigned_customers": "26",
      "joined_date": "24,Oct,2023",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1672239496290-5061cfee7ebb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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

                              // Delivery Boy
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "DELIVERY BOY",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // Joined At
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "JOINED AT",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // Work Time
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "WORK TIME",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // Assigned With
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "ASSIGNED WITH",
                                  style: TextStyle(
                                    color: AppColors.tableTitleColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // Salary
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "SALARY",
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
                            itemCount: agents.length,
                            itemBuilder: (context, index) {
                              final agent = agents[index];
                              return DeliveryAgentCard(
                                agent: agent,
                                isSelected:
                                    context
                                        .watchDeliveryAgentProvider
                                        .selectedAgent ==
                                    agent,
                                onTap: () {
                                  // Select Delivery Agent
                                  context.readDeliveryAgentsProvider
                                      .setSelectedAgent(agent);

                                  // Read Delivery Agent
                                  context.readDeliveryAgentsProvider
                                      .setViewDetailsEnabled(true);
                                },
                                deliveryAgentCardImageUrl:
                                    agent["imageUrl"] ?? '',
                                deliveryAgentName: agent["name"] ?? '',
                                deliveryAgentPhoneNumber: agent["phone"] ?? '',
                                deliveryAgentAddress: agent["address"] ?? '',
                                deliveryAgentJoinedAt:
                                    agent["joined_date"] ?? '',
                                deliveryAgentWorkTime: agent["work_time"] ?? '',
                                deliveryAgentAssignedWith:
                                    agent["assigned_customers"] ?? '',
                                deliveryAgentSalary: agent["salary"] ?? '',
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
                  child: Consumer<DeliveryAgentsProvider>(
                    builder: (context, agentProvider, child) {
                      if (agentProvider.isAddedEntriesEnabled) {
                        return AddAgentForm(
                          onClose: () =>
                              context.readDeliveryAgentsProvider.resetAll(),
                          onAddVendor: (Map<String, String> data) {
                            agents.add(data);
                            context.readDeliveryAgentsProvider.resetAll();
                            context.showSuccessSnackBar(
                              "${data['name']} has been added successfully",
                            );
                          },
                        );
                      } else if (agentProvider.isViewEntriesDetailsEnabled) {
                        return ViewAgentDetails(
                          vendorDetails:
                              context.readDeliveryAgentsProvider.selectedAgent!,
                        );
                      } else if (agentProvider.isEditEntriesEnabled) {
                        return EditAgentDetailsForm(
                          onClose: () => context.readDeliveryAgentsProvider.resetAll(),
                          onAddVendor: (Map<String, String> p1) {},
                        );
                      } else if (agentProvider.isEditEnabled) {
                        return AssignCustomerWidget(
                          onClose: () => context.readDeliveryAgentsProvider.resetAll(),
                        );
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