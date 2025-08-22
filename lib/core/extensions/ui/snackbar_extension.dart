import 'package:farm_thoughts_web_app/commons/widgets/k_snackbar.dart';
import 'package:flutter/material.dart';

extension CustomSnackBarExtension on BuildContext {
  void showCustomSnackBar({
    required String message,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    CustomSnackBar.show(
      this,
      message: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      duration: duration,
      onTap: onTap,
    );
  }

  void showSuccessSnackBar(String message, {VoidCallback? onTap}) {
    CustomSnackBar.showSuccess(this, message: message, onTap: onTap);
  }

  void showErrorSnackBar(String message, {VoidCallback? onTap}) {
    CustomSnackBar.showError(this, message: message, onTap: onTap);
  }
}
