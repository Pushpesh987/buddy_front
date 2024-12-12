import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/theme.dart';

class EditProfileAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;
  final double height;

  const EditProfileAppBar({
    super.key,
    required this.title,
    this.onBackButtonPressed,
    this.height = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
      height: height,
      color: AppPalette.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: AppPalette.blackSelectedItemColor),
            onPressed: onBackButtonPressed ?? () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          Text(
            title,
            style: AppTheme.headlineSmallStyle1.copyWith(
              color: AppTheme.lightThemeMode.colorScheme.onSurface,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
