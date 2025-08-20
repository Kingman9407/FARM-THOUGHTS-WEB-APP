import 'package:farm_thoughts_web_app/core/constants/app_assets.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KDeliveryEntriesCard extends StatelessWidget {
  const KDeliveryEntriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber,
      ),
      child: Row(
        spacing: 12,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ClipOval(
              child: SvgPicture.asset(
                AppAssets.googleLogo,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Muhammed Tariq - 6325874196",
                style: TextStyle(
                  fontSize: context.subtitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "5, Gandhi St, Nehru Nagar, Muthiyalpet , white town",
                style: TextStyle(
                  fontSize: context.bodyText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text("08, Jan’22  14:00"),
          Text("-1 L "),
          Text("₹ 20+"),
          ClipOval(
            child: SvgPicture.asset(
              AppAssets.googleLogo,
              width: 50,
              height: 50,
            ),
          ),
          Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "N Saravanan",
                style: TextStyle(
                  fontSize: context.subtitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("6325874196"),
            ],
          ),
        ],
      ),
    );
  }
}
