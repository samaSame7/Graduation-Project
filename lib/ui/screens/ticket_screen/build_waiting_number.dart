import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class BuildWaitingNumber extends StatelessWidget {
  const BuildWaitingNumber({super.key, required this.decoration});
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: decoration,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "18",
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: "عدد المنتظرين",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBlue,
                  ),
                  children: [
                    TextSpan(
                      text: ":\u200F",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
