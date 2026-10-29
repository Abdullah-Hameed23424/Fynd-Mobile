import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fynd/core/dimensions/dimensions.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';

enum ConfirmationStatus { info, success, warning, danger }

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.onCancel,
    this.confirmText,
    this.cancelText,
    this.status = ConfirmationStatus.info,
    this.autoPopConfirm = true,
  });

  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String? confirmText;
  final String? cancelText;
  final ConfirmationStatus status;
  final bool autoPopConfirm;

  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    String? confirmText,
    String? cancelText,
    ConfirmationStatus status = ConfirmationStatus.info,
    bool barrierDismissible = false,
    bool autoPopConfirm = true,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ConfirmationDialog(
        title: title,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmText: confirmText,
        cancelText: cancelText,
        status: status,
        autoPopConfirm: autoPopConfirm,
      ),
    );
  }

  Color _statusColor() {
    switch (status) {
      case ConfirmationStatus.success:
        return const Color.fromARGB(255, 74, 233, 156);
      case ConfirmationStatus.warning:
        return Colors.orange;
      case ConfirmationStatus.danger:
        return Colors.red;
      case ConfirmationStatus.info:
        return AppColors.primary;
    }
  }

  IconData _statusIcon() {
    switch (status) {
      case ConfirmationStatus.success:
        return Icons.check_circle_rounded;
      case ConfirmationStatus.warning:
        return Icons.warning_amber_rounded;
      case ConfirmationStatus.danger:
        return Icons.error_rounded;
      case ConfirmationStatus.info:
        return Icons.info_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color accent = _statusColor();

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ZoomIn(
        child: Container(
          padding: EdgeInsets.all(Dimensions.autoSize(24)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.autoSize(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ZoomIn(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  width: Dimensions.autoSize(80),
                  height: Dimensions.autoSize(80),
                  decoration: BoxDecoration(
                    color: accent.withAlpha(65),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _statusIcon(),
                    size: Dimensions.autoSize(40),
                    color: accent,
                  ),
                ),
              ),
              SizedBox(height: Dimensions.autoSize(24)),
              Text(
                title,
                style: context.titleMedium19,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.autoSize(12)),
              Text(
                content,
                style: context.bodyMedium16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.autoSize(32)),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: Dimensions.autoSize(48),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                          Dimensions.autoSize(12),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onCancel?.call();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimensions.autoSize(12),
                            ),
                          ),
                        ),
                        child: Text(
                          cancelText ?? 'Cancel',
                          style: context.bodySmall14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.autoSize(12)),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: Dimensions.autoSize(48),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [accent, accent.withAlpha(200)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                          Dimensions.autoSize(12),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: accent.withAlpha(40),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (autoPopConfirm) {
                            Navigator.of(context).pop();
                          }
                          onConfirm();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              Dimensions.autoSize(12),
                            ),
                          ),
                        ),
                        child: Text(
                          confirmText ?? 'Confirm',
                          style: context.bodySmall14.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
