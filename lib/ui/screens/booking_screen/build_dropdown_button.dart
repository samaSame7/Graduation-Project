import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class BuildDropdownButton extends StatelessWidget {
  const BuildDropdownButton({
    super.key,
    required this.selectedService,
    required this.items,
    required this.onChanged,
  });

  final String? selectedService;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightBlue,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedService,
                hint: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اضغط لاختيار الخدمة...",
                    textAlign: TextAlign.right,
                    style: AppStyles.blue16regular,
                  ),
                ),
                iconSize: 0,
                items: items.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        e,
                        textAlign: TextAlign.right,
                        style: AppStyles.blue16regular,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.darkBlue,
          ),
        ],
      ),
    );
  }
}