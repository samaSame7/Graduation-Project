import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../ticket_screen/ticket_screen.dart';
import 'build_dropdown_button.dart';
import 'build_role_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});
  static const String routeName = "bookNow";

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedRole = "طالب";
  String? selectedService;

  final List<String> services = [
    "استخراج شهادة",
    "توثيق ورقي",
    "استعلام",
  ];

  void _changeRole(String newRole) {
    setState(() {
      selectedRole = newRole;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.babyBlue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.west_rounded,
                      size: 24,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                const Text(
                  "الحجز",
                  style: AppStyles.blue34regular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  "اختر صفتك:",
                  style: AppStyles.blue26regular,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    BuildRoleButton(
                      title: "طالب",
                      selectedRole: selectedRole,
                      onRoleChanged: _changeRole,
                    ),
                    const SizedBox(width: 8),
                    BuildRoleButton(
                      title: "ولي أمر",
                      selectedRole: selectedRole,
                      onRoleChanged: _changeRole,
                    ),
                    const SizedBox(width: 8),
                    BuildRoleButton(
                      title: "خريج",
                      selectedRole: selectedRole,
                      onRoleChanged: _changeRole,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "الخدمة المطلوبة:",
                  style: AppStyles.blue26regular,
                ),
                const SizedBox(height: 8),
                BuildDropdownButton(
                  items: services,
                  selectedService: selectedService,
                  onChanged: (newValue) {
                    setState(() {
                      selectedService = newValue;
                    });
                  },
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Image.asset(
                    AppAssets.bookingImg,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  onPress: () {
                    if (selectedService == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "يرجى اختيار الخدمة المطلوبة أولاً",
                            style: AppStyles.white20regular,
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    Navigator.pushNamed(context, TicketScreen.routeName);
                  },
                  text: 'تأكيد الحجز',
                  foreColor: AppColors.white,
                  bkColor: AppColors.blue,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
