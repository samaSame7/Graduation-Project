import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/main_screen/main_screen.dart';
import 'package:flutter_application_1/ui/screens/thanks_screen/thanks_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import 'build_customer_number.dart';
import 'build_customer_status.dart';
import 'build_waiting_number.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});
  static const String routeName = "thanks";

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: AppColors.lightBlue,
      borderRadius: BorderRadius.circular(18),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.babyBlue,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),
              const Text(
                "التذكرة الحالية",
                style: AppStyles.blue26regular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              const BuildCustomerNumber(),
              const SizedBox(height: 25),
              BuildWaitingNumber(decoration: decoration),
              const SizedBox(height: 20),
              BuildCustomerStatus(decoration: decoration),
              const Spacer(),
              AppButton(
                onPress: () {Navigator.pushNamed(context, ThanksScreen.routeName);},
                text: 'إنهاء',
                bkColor: AppColors.blue,
                foreColor: AppColors.white,
              ),
              const SizedBox(height: 10),
              AppButton(
                onPress: () {Navigator.pushNamed(context, MainScreen.routeName);},
                text: 'الغاء التذكرة',
                bkColor: AppColors.gray,
                foreColor: AppColors.darkBlue,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
