import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // تأكد أن المسار صحيح
import '../utils/app_styles.dart'; // تأكد أن المسار صحيح
import 'faq_dm.dart';

class BuildServiceWidget extends StatelessWidget {
  const BuildServiceWidget({
    super.key,
    required this.item,
    required this.isOpen,
    required this.onExpansionChanged,
    //required this.title,
  });

  final FaqDm item;
  //final String title;
  final bool isOpen;
  final Function(bool) onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          key: Key('${item.id}-$isOpen'),
          initiallyExpanded: isOpen,
          onExpansionChanged: onExpansionChanged,
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Text(
            item.title,
            textAlign: TextAlign.right,
            style: AppStyles.blue24regular,
          ),
          trailing: Icon(
            isOpen
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
            color: AppColors.darkBlue,
          ),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                item.content,
                textAlign: TextAlign.right,
                style: AppStyles.blue16regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}