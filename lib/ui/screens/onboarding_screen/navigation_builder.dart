import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class NavigationBuilder extends StatelessWidget {
  final int currentIndex;

  const NavigationBuilder({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        AppConstants.pages.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentIndex == index ? 35 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.blue
                : AppColors.darkBlue.withAlpha(75),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}