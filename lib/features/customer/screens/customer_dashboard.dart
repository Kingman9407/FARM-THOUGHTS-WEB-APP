import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/customer/provider/customer_provider.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/edit_customer.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/add_customer.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/add_deliviry_person.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/customer_card.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/customer_qr.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/view_customer_details.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_assets.dart';

class CustomerDashboardScreen extends StatefulWidget {
  const CustomerDashboardScreen({super.key});



  @override
  State<CustomerDashboardScreen> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboardScreen> {
  final TextEditingController customerSearchController = TextEditingController();
  final List<Map<String, String>> customer = [
    {
      "imageURL": "https://randomuser.me/api/portraits/men/32.jpg",
      "name": "Arjun Kumar",
      "phone": "91 9876543210",
      "address": "12, Green Park, Delhi",
      "Delivered_by": "Rahul Sharma",
      "Plan": "Monthly Plan",
      "Price": "₹1200",
      "Current Bill": "₹800"
    },
    {
      "imageURL": "https://randomuser.me/api/portraits/women/45.jpg",
      "name": "Sneha Reddy",
      "phone": "91 9123456780",
      "address": "34, Blue Lane, Mumbai",
      "Delivered_by": "Ankit Verma",
      "Plan": "Quarterly Plan",
      "Price": "₹3500",
      "Current Bill": "₹1500"
    },
    {
      "imageURL": "https://randomuser.me/api/portraits/men/76.jpg",
      "name": "Rohan Mehta",
      "phone": "91 9988776655",
      "address": "56, Lake View, Bangalore",
      "Delivered_by": "Priya Singh",
      "Plan": "Yearly Plan",
      "Price": "₹12000",
      "Current Bill": "₹4000"
    }



  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldGreyThemeColor,
      body: Column(
        children: [
          Container(
            child: DashboardTopBar(searchTextEditingController: customerSearchController , userImageUrl: '',),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),

                        child:  Row(
                          children: [
                            // Add New
                            Expanded(
                              flex: 2,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    // Add Enabled Functionality
                                    context.readCustomerProvider
                                        .setAddCustomerEnable(true);
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
                                "CUSTOMER",
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
                                "DELIVERD BY",
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
                                "PLAN",
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
                                "PRICE",
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
                                "CURRENT BILL",
                                style: TextStyle(
                                  color: AppColors.tableTitleColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ),
                        Expanded(child:
                        ListView.builder(itemCount: customer.length,
                            itemBuilder: (context,index) {
                          return CustomerCard(customer: customer[index],
                            isSelected:
                              context.watchCustomerProvider.selectedCustomer == customer[index],
                            onTap: () {
                              AppLoggerHelper.logInfo("tap");
                            context.readCustomerProvider.setSelectedCustomer(customer[index]);
                            context.readCustomerProvider.setViewDetailsEnable(true);



                            },

                          );
                            }
                        )
                        )
                      ],
                    ),
                  ),

                ),
                Expanded(

                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(8),
                    child: Consumer<CustomerProvider>(
                        builder: (context, customerProvider,child) {
                          if (customerProvider.isViewDetailsEnabled){
                            return ViewCustomerDetails(customerDetails:context.readCustomerProvider.selectedCustomer!,);

                          } else if (customerProvider.isAddedEnabled){
                            return AddCustomer();
                          }
                          else if(customerProvider.isAddDeliveryAgent){
                            return AddDeliveryPerson();

                          } else if(customerProvider.isQrEnable) {
                            return CustomerQr();
                          } else if(customerProvider.isEditEnabled){
                            return Editcustomer();
                          }
                          else {
                            return KCalender();
                          }

                        },
                    ),
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
