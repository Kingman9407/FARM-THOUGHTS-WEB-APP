import 'package:farm_thoughts_web_app/commons/widgets/k_button.dart';
import 'package:farm_thoughts_web_app/commons/widgets/k_outline_button.dart';
import 'package:farm_thoughts_web_app/core/extensions/ui/responsive_layout.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DeleteDeliveryAgent extends StatefulWidget {
  final Future<void> Function() onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String message;

  const DeleteDeliveryAgent({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    required this.message,
  });

  @override
  State<DeleteDeliveryAgent> createState() => _DeleteDeliveryAgentState();
}

class _DeleteDeliveryAgentState extends State<DeleteDeliveryAgent> {
  bool isLoading = false;

  Future<void> _handleConfirm() async {
    setState(() {
      isLoading = true;
    });

    try {
      await widget.onConfirm();
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          isLoading = false;
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.screenWidth * 0.35),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: context.screenWidth * 0.06,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(widget.message, textAlign: TextAlign.center),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    KOutlineButton(
                      text: "Cancel",
                      onPressed: isLoading ? null : widget.onCancel,
                      borderColor: AppColors.checkOutColor,
                      textColor: AppColors.checkOutColor,
                    ),
                    const SizedBox(width: 12),
                    KButton(
                      text: "Delete",
                      onPressed: _handleConfirm,
                      backgroundColor: AppColors.checkOutColor,
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
