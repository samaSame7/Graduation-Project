import 'package:flutter/material.dart';
import 'ui/screens/splash_screen/splash_screen.dart';
import 'ui/screens/booking_screen/booking_screen.dart';
import 'ui/screens/onboarding_screen/onboarding_screen.dart';
import 'ui/screens/ticket_screen/ticket_screen.dart';
import 'ui/screens/common_questions_screen/common_questions_screen.dart';
import 'ui/screens/main_screen/main_screen.dart';
import 'ui/screens/service_requirement_screen/service_requirement_screen.dart';
import 'ui/screens/thanks_screen/thanks_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        FaqScreen.routeName: (context) => const FaqScreen(),
        ServiceRequirementScreen.routeName: (context) => const ServiceRequirementScreen(),
        BookingScreen.routeName: (context) => const BookingScreen(),
        TicketScreen.routeName: (context) => const TicketScreen(),
        ThanksScreen.routeName: (context) => const ThanksScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
