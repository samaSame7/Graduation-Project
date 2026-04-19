import 'package:flutter/material.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../../../data/models/faq_dm.dart';
import '../../../data/service_requirements_api_service.dart';
import '../../../data/ticket_api_service.dart';
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
  FaqDm? _selectedServiceObject;
  bool _isLoading = false;

  List<FaqDm> _apiServices = [];
  final ServiceRequirementsApiService _serviceApi =
      ServiceRequirementsApiService();
  final TicketApiService _ticketApi = TicketApiService();

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  Future<void> _fetchServices() async {
    try {
      final services = await _serviceApi.fetchServiceRequirements();
      if (mounted) {
        setState(() {
          _apiServices = services;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("حدث خطأ أثناء تحميل الخدمات")),
        );
      }
    }
  }

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
                _apiServices.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : BuildDropdownButton(
                        items: _apiServices.map((e) => e.title).toList(),
                        selectedService: _selectedServiceObject?.title,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedServiceObject = _apiServices.firstWhere(
                                (element) => element.title == newValue);
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
                  onPress: () async {
                    if (_selectedServiceObject == null) {
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

                    setState(() => _isLoading = true);

                    try {
                      final ticket = await _ticketApi.createTicket(
                        roleTitle: selectedRole,
                        serviceId: _selectedServiceObject!.id,
                      );

                      if (mounted) {
                        setState(() => _isLoading = false);
                        Navigator.pushNamed(context, TicketScreen.routeName,
                            arguments: ticket);
                      }
                    } catch (e) {
                      if (mounted) {
                        setState(() => _isLoading = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "فشل الحجز: يرجى المحاولة مرة أخرى",
                              style: AppStyles.white20regular,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  text: _isLoading ? 'جاري الحجز...' : 'تأكيد الحجز',
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
