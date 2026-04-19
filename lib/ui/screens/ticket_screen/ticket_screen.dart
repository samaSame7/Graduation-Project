import 'dart:async';
import 'package:flutter/material.dart';
import '../main_screen/main_screen.dart';
import '../thanks_screen/thanks_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../../../data/models/ticket_dm.dart';
import '../../../data/ticket_api_service.dart';
import 'build_customer_number.dart';
import 'build_customer_status.dart';
import 'build_waiting_number.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});
  static const String routeName = "thanks";

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  bool _isCancelling = false;
  final TicketApiService _ticketApi = TicketApiService();

  TicketDm? _currentTicket;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentTicket == null) {
      _currentTicket = ModalRoute.of(context)!.settings.arguments as TicketDm;
      _startStatusTimer();
    }
  }

  void _startStatusTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (_currentTicket != null && !_isCancelling) {
        try {
          final updatedTicket =
              await _ticketApi.getTicketById(_currentTicket!.id);
          if (mounted) {
            setState(() {
              _currentTicket = updatedTicket;
            });
          }
        } catch (e) {
          debugPrint("Error updating status: $e");
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentTicket == null)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));

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
              const Text("التذكرة الحالية",
                  style: AppStyles.blue26regular, textAlign: TextAlign.center),
              const SizedBox(height: 35),
              BuildCustomerNumber(ticketNo: _currentTicket!.ticketNo),
              const SizedBox(height: 25),
              FutureBuilder<String>(
                future: _ticketApi
                    .getRemainingWaitingCount(_currentTicket!.serviceId),
                builder: (context, snapshot) {
                  return BuildWaitingNumber(
                    decoration: decoration,
                    waitingCount: snapshot.data ?? "...",
                  );
                },
              ),
              const SizedBox(height: 20),
              BuildCustomerStatus(
                  decoration: decoration, status: _currentTicket!.status),
              const Spacer(),
              AppButton(
                onPress: () =>
                    Navigator.pushNamed(context, ThanksScreen.routeName),
                text: 'إنهاء',
                bkColor: AppColors.blue,
                foreColor: AppColors.white,
              ),
              const SizedBox(height: 10),
              AppButton(
                onPress: _isCancelling
                    ? () {}
                    : () async {
                        setState(() => _isCancelling = true);
                        try {
                          await _ticketApi.cancelTicket(_currentTicket!.id);
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("تم إلغاء التذكرة بنجاح",
                                    style: AppStyles.white16regular),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushNamedAndRemoveUntil(context,
                                MainScreen.routeName, (route) => false);
                          }
                        } catch (e) {
                          if (mounted) {
                            setState(() => _isCancelling = false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "فشل الإلغاء، يرجى المحاولة مرة أخرى",
                                    style: AppStyles.white16regular),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                text: _isCancelling ? 'جاري الإلغاء...' : 'الغاء التذكرة',
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
