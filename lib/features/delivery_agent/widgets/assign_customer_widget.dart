import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_seach_field.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:farm_thoughts_web_app/features/delivery_agent/widgets/add_customer_card.dart';
import 'package:flutter/material.dart';

class AssignCustomerWidget extends StatefulWidget {
  final VoidCallback onClose;

  const AssignCustomerWidget({super.key, required this.onClose});

  @override
  State<AssignCustomerWidget> createState() => _AssignCustomerWidgetState();
}

class _AssignCustomerWidgetState extends State<AssignCustomerWidget> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
      width: context.screenWidth * 0.5,
      color: AppColors.whiteColor,
      child: Column(
        spacing: context.screenWidth * 0.009,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              KButton(
                text: "Next",
                onPressed: () {},
                backgroundColor: AppColors.primaryColor,
              ),
              // KButton(
              //   text: "Submit",
              //   onPressed: () {},
              //   backgroundColor: AppColors.primaryColor,
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Assign Customer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          KSearchField(controller: searchController),
          SizedBox(height: context.screenWidth * 0.002),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AddCustomerCard(onPressed: () {});
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
