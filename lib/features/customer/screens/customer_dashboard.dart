import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_calender.dart';
import 'package:farm_thoughts_web_app/core/extensions/providers/provider_extension.dart';
import 'package:farm_thoughts_web_app/core/helpers/app_logger_helper.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/customer/provider/customer_provider.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/add_customer.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/customer_card.dart';
import 'package:farm_thoughts_web_app/features/customer/widgets/view_customer_details.dart';
import 'package:farm_thoughts_web_app/features/dashboard/widgets/dashboard_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDashboardScreen extends StatefulWidget {
  const CustomerDashboardScreen({super.key});



  @override
  State<CustomerDashboardScreen> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboardScreen> {
  final TextEditingController CustomerSearchController = TextEditingController();
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
    }


  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DashboardTopBar(searchTextEditingController: CustomerSearchController , userImageUrl: '',),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(3),
                      child:KButton
                        (text: "Add new", onPressed:() {
                         context.readCustomerProvider.setAddCustomerEnable(
                          true,
                             );

                      },
                        backgroundColor: AppColors.primaryColor,
                      ),
                      ),
                      Container(
                        color: Colors.grey.shade200,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),

                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              "CUSTOMER",
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Text(
                              "DELIVERD BY",
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "PLAN",
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "PRICE",
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "CURRENT BILL",
                              style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.w600,
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
