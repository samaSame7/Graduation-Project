import 'package:flutter/material.dart';
import 'package:graduation_project/ui/utils/app_styles.dart';
import '../../utils/app_colors.dart';

class BuildWaitingNumber extends StatelessWidget {
  final BoxDecoration decoration;
  final String waitingCount;

  const BuildWaitingNumber(
      {super.key, required this.decoration, required this.waitingCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              waitingCount,
              style: AppStyles.blue16regular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          const Row(
            children: [
              Text.rich(
                TextSpan(
                  text: "عدد المنتظرين",
                  style: AppStyles.blue16regular,
                  children: [
                    TextSpan(
                      text: ":\u200F",
                      style: AppStyles.blue26regular,
                    )
                  ],
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.people, color: AppColors.darkBlue),
            ],
          ),
        ],
      ),
    );
  }
}
