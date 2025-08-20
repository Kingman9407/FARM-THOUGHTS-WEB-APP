import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(backgroundAsset),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: SvgPicture.asset(iconAsset, width: 30),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: context.subtitle,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: context.subtitle,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
