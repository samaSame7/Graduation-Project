import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class BuildCustomerNumber extends StatelessWidget {
  const BuildCustomerNumber({super.key, required this.ticketNo});
  final String ticketNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: const Color(0xffbbdefb),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        children: [
          Text.rich(
            TextSpan(
              text: "رقمك",
              style: AppStyles.blue26regular,
              children: [
                TextSpan(
                  text: ":\u200F",
                  style: AppStyles.blue26regular,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(ticketNo, style: AppStyles.blue26regular),
        ],
      ),
    );
  }
}
