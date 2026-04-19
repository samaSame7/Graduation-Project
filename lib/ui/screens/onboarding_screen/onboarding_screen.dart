import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_styles.dart';
import 'build_elevated_button.dart';
import 'navigation_builder.dart';
import 'pageview_builder.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "Onboarding";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _imageController;
  late PageController _textController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _imageController = PageController();
    _textController = PageController();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageviewBuilder(
                pageController: _imageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  _textController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: AppColors.babyBlue,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    NavigationBuilder(currentIndex: _currentIndex),
                    const SizedBox(height: 10),
                    Expanded(
                      child: PageView.builder(
                        controller: _textController,
                        itemCount: AppConstants.pages.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(
                              AppConstants.pages[index]['desc']!,
                              textAlign: TextAlign.center,
                              style: AppStyles.blue50regular,
                            ),
                          );
                        },
                      ),
                    ),
                    BuildElevatedButton(
                      currentIndex: _currentIndex,
                      imageController: _imageController,
                    ),
                    if (_currentIndex == AppConstants.pages.length - 1) ...[
                      const SizedBox(height: 8),
                      const Text(
                        "ابدأ الآن",
                        style: AppStyles.blue26regular,
                      ),
                    ] else ...[
                      const SizedBox(height: 8),
                      Text("ابدأ الآن",
                          style: AppStyles.blue26regular
                              .copyWith(color: AppColors.babyBlue)),
                    ],
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
