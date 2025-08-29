import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddDeliveryAgentsEntries extends StatelessWidget {
  const AddDeliveryAgentsEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.01,
        vertical: context.screenHeight * 0.02,
      ),
      width: context.screenWidth * 0.5,
      color: AppColors.whiteColor,

      child: Column(children: []),
    );
  }
}
