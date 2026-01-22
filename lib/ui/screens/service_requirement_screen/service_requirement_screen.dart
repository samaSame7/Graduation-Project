import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../widgets/app_constants.dart';
import '../../widgets/build_search_widget.dart';
import '../../widgets/build_service_message.dart';

class ServiceRequirementScreen extends StatefulWidget {
  const ServiceRequirementScreen({super.key});
  static const String routeName = "serviceRequirements";

  @override
  State<ServiceRequirementScreen> createState() =>
      _ServiceRequirementScreenState();
}

class _ServiceRequirementScreenState extends State<ServiceRequirementScreen> {
  int? _openId;
  String _search = "";


  @override
  Widget build(BuildContext context) {
    final filtered = AppConstants.SRtems.where(
            (e) => e.title.contains(_search) || e.content.contains(_search))
        .toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.babyBlue,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(
                      Icons.east_rounded,
                      size: 24,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "متطلبات الخدمة",
                        style: AppStyles.blue26regular,
                      ),
                    ),
                    const SizedBox(width: 12),
                    BuildSearchWidget(
                      onChanged: (value) {
                        setState(() {
                          _search = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      final bool isOpen = _openId == item.id;

                      return BuildServiceWidget(
                        item: item,
                        isOpen: isOpen,
                        onExpansionChanged: (isExpanded) {
                          setState(() {
                            _openId = isExpanded ? item.id : null;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
