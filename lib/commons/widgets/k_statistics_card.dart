import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KStatisticsCard extends StatelessWidget {
  final String backgroundAsset;
  final String iconAsset;
  final String title;
  final String value;

  const KStatisticsCard({
    super.key,
    required this.backgroundAsset,
    required this.iconAsset,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenWidth * 0.012),
      ),
      clipBehavior: Clip.antiAlias,

      child: Row(
        children: [
          Expanded(
            flex: 2, // background takes ~40%
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.screenWidth * 0.012,
                  ),
                  child: SvgPicture.asset(
                    backgroundAsset,
                    width: double.infinity,
                    height: context.screenHeight * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: context.screenWidth * 0.01,
                  top: context.screenHeight * 0.04,
                  child: SvgPicture.asset(
                    iconAsset,
                    width: context.screenWidth * 0.013,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3, // text side takes ~60%
            child: Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.03),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: context.screenWidth * 0.009,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.screenWidth * 0.013,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.end,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
