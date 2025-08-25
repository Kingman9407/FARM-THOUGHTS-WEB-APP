import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OAuthButton extends StatelessWidget {
  final double height;
  final double width;
  final String btnTitle;
  final String btnSvgPath;
  final VoidCallback onPressed;

  const OAuthButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.btnTitle,
    required this.btnSvgPath,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.08,
            vertical: context.screenHeight * 0.02,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Btn Logo
              SvgPicture.asset(btnSvgPath, height: context.screenHeight * 0.03),

              SizedBox(width: context.screenWidth * 0.01),

              // Btn Title
              Text(
                btnTitle,
                style: TextStyle(
                  color: AppColors.oAuthBtnTitle,
                  fontSize: context.screenWidth * 0.013,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
