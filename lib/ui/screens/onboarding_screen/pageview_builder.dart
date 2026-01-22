import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_constants.dart';

class PageviewBuilder extends StatelessWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const PageviewBuilder({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: AppConstants.pages.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        var page = AppConstants.pages[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              page['image']!,
              fit: BoxFit.contain,
              //height: MediaQuery.of(context).size.height * .35,
            ),
            const SizedBox(height: 15),
            if (page['desc']!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  page['desc']!,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: AppColors.darkBlue, fontSize: 18),
                ),
              ),
          ],
        );
      },
    );
  }
}
