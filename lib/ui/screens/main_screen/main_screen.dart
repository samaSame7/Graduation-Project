import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../booking_screen/booking_screen.dart';
import '../common_questions_screen/common_questions.dart';
import '../service_requirement_screen/service_requirement_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String routeName = "mainScreen";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "ازاي نقدر نساعدك؟",
                    style: AppStyles.blue34regular,
                  ),
                  const SizedBox(height: 22),
                  Image.asset(
                    AppAssets.mainImg,
                    height: MediaQuery.of(context).size.height * .35,
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    text: "الاسئلة الشائعة",
                    icon: Icons.question_answer_rounded,
                    onPress: () {
                      Navigator.pushNamed(context, FaqScreen.routeName);
                    },
                    bkColor: AppColors.blue,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    text: "متطلبات الخدمات",
                    icon: Icons.list_alt_rounded,
                    onPress: () {
                      Navigator.pushNamed(
                          context, ServiceRequirementScreen.routeName);
                    },
                    bkColor: AppColors.blue,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    text: "احجز دورك الآن",
                    icon: Icons.assignment_turned_in_rounded,
                    onPress: () {
                      Navigator.pushNamed(context, BookingScreen.routeName);
                    },
                    bkColor: AppColors.blue,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
