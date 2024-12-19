import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class AttractiveListTile extends StatelessWidget {
  final String? text;
  const AttractiveListTile({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.yellowColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          title: Text(
            text!,
            style: AppTheme.labelLargeStyle.copyWith(
              color: AppTheme.lightThemeMode.colorScheme.onSecondary,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: AppPalette.blackColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
