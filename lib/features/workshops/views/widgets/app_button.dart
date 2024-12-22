import 'package:buddy_front/core/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class WorkshopButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const WorkshopButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: AppPalette.yellowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppPalette.blackColor,
            width: 1,
          ),
        ),
        minimumSize: Size(
          MediaQuery.of(context).size.width * 1.0,
          55,
        ),
      ),
      child: Text(
        buttonText,
        style: AppTheme.titleMediumStyle.copyWith(
          color: AppTheme.lightThemeMode.colorScheme.onSurface,
        ),
      ),
    );
  }
}
