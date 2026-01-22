import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart'; // 1. تأكد من وجود هذا الاستيراد

class BuildSearchWidget extends StatelessWidget {
  const BuildSearchWidget({
    super.key,
    required this.onChanged, // 2. استقبال دالة التغيير
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  cursorColor: AppColors.white,
                  onChanged: onChanged, // 3. ربط التغيير بالدالة الممررة
                  style: AppStyles.white15regular,
                  decoration: const InputDecoration(
                    hintText: 'بحث',
                    hintStyle: AppStyles.white15regular,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                  ),
                ),
              ),
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}