import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class BuildCustomerStatus extends StatelessWidget {
  final BoxDecoration decoration;
  final String status;

  const BuildCustomerStatus(
      {super.key, required this.decoration, required this.status});

  String _getArabicStatus(String englishStatus) {
    switch (englishStatus.toLowerCase()) {
      case 'pending':
        return "في الإنتظار";
      case 'in_progress':
        return "جاري الخدمة";
      case 'serving':
        return "جاري الخدمة";
      case 'finished':
        return "مكتمل";
      case 'cancelled':
        return "ملغي";
      default:
        return englishStatus;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      // استخدام المعامل الثلاثي بدلاً من if لتحديد اللون
      decoration: decoration.copyWith(
        color: _getArabicStatus(status) != "جاري الخدمة"
            ? AppColors.gray
            : AppColors.lightBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _getArabicStatus(status),
              style: AppStyles.blue16regular,
            ),
          ),
          const Row(
            children: [
              Text.rich(
                TextSpan(
                  text: "الحالة",
                  style: AppStyles.blue16regular,
                  children: [
                    TextSpan(
                      text: ":\u200F",
                      style: AppStyles.blue16regular,
                    )
                  ],
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.edit, color: AppColors.darkBlue),
            ],
          ),
        ],
      ),
    );
  }
}
