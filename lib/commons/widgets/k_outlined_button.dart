import 'package:flutter/material.dart';

class KOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnTitle;
  final Color btnBorderColor;
  final Color btnTextColor;

  const KOutlinedButton({
    super.key,
    required this.onTap,
    required this.btnTitle,
    required this.btnBorderColor,
    required this.btnTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(color: btnBorderColor, width: 1),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        btnTitle,
        style: TextStyle(color: btnTextColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
