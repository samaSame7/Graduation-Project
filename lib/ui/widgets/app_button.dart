import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onPress,
      required this.text,
      this.bkColor = AppColors.blue,
      this.foreColor = AppColors.white,
      this.icon});
  final VoidCallback onPress;
  final String text;
  final Color? bkColor;
  final Color? foreColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: bkColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlue.withAlpha(20),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 26,
                  color: foreColor,
                ),
                const SizedBox(width: 18),
              ],
              Expanded(child: Text(text, style: AppStyles.white20regular.copyWith(color: foreColor),textAlign: TextAlign.center,)),
            ],
          ),
        ),
      ),
    );
  }
}
