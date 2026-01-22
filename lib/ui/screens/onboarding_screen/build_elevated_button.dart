import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_constants.dart';
import '../main_screen/main_screen.dart';

class BuildElevatedButton extends StatelessWidget {
  const BuildElevatedButton({super.key, required this.currentIndex, required this.imageController});
  final int currentIndex;
  final PageController imageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (currentIndex == AppConstants.pages.length - 1) {
          Navigator.pushReplacementNamed(
              context, MainScreen.routeName);
        } else {
          imageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.blue,
        elevation: 0,
      ),
      child: const Icon(Icons.arrow_forward_rounded,
        size: 32,
      ),
    );
  }
}
