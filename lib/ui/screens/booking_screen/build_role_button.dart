import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class BuildRoleButton extends StatelessWidget {
  const BuildRoleButton({
    super.key,
    required this.title,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  final String title;
  final String selectedRole;
  final ValueChanged<String> onRoleChanged;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedRole == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          onRoleChanged(title);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue : AppColors.lightBlue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: AppColors.darkBlue.withAlpha(30),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Text(
            title,
            style:
                isSelected ? AppStyles.white16regular : AppStyles.blue16regular,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
