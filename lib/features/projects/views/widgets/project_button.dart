import 'package:buddy_front/core/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class ProjectButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onTap;
  final bool isLoading;

  const ProjectButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: isLoading ? AppPalette.yellowColor.withOpacity(0.7) : AppPalette.yellowColor,
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
      child: isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: AppPalette.blackColor,
                strokeWidth: 2.0,
              ),
            )
          : Text(
              buttonText ?? '',
              style: AppTheme.titleMediumStyle.copyWith(
                color: AppTheme.lightThemeMode.colorScheme.onSurface,
              ),
            ),
    );
  }
}
