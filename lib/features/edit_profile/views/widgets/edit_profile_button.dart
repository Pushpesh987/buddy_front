import 'package:buddy_front/core/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class EditProfileButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color buttonColor; // Added color property for the button background
  final Color textColor; // Added color property for the text

  const EditProfileButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.buttonColor, // Ensure to pass the color
    required this.textColor, // Ensure to pass the text color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: buttonColor, // Use dynamic color
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
          color: textColor, // Use dynamic text color
        ),
      ),
    );
  }
}
