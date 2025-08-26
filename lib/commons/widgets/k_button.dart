import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KButton extends StatelessWidget {
  final String? svgAssetPath; // for SVG icons
  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? iconColor;
  final double? iconSize;
  final FontWeight? fontWeight;

  const KButton({
    super.key,
    this.svgAssetPath,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
    this.textColor,
    this.iconColor,
    this.iconSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (svgAssetPath != null) ...[
              SvgPicture.asset(
                svgAssetPath!,
                color: iconColor ?? AppColors.whiteColor,
                width: iconSize ?? context.screenWidth * 0.01,
                height: iconSize ?? context.screenWidth * 0.01,
              ),
              SizedBox(width: context.screenWidth * 0.004),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor ?? AppColors.whiteColor,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
