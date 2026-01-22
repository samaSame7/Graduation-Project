import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../main_screen/main_screen.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});
  static const String routeName = "thanksScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.babyBlue,
        body: Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.fciLogo,
                height: 180,
                alignment: AlignmentGeometry.topLeft,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                ' شكرا',
                style: AppStyles.blue50regular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Expanded(
                child: Text(
                  'لاستخدامك منصة خدمات كلية الحاسبات والمعلومات',
                  style: AppStyles.blue26regular,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  onPress: () {
                    Navigator.pushNamed(context, MainScreen.routeName);
                  },
                  text: " العودة للصفحة الرئيسية",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
