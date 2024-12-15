import 'package:buddy_front/core/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class EditProfileButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final Color buttonColor;
  final Color textColor;
  final bool enabled;
  final bool isFullWidth;

  const EditProfileButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
    this.enabled = true,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFullWidth
        ? ElevatedButton(
            onPressed: enabled ? onTap : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: AppPalette.blackColor,
                  width: 1,
                ),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width * 1.0, 55),
            ),
            child: Text(
              buttonText,
              style: AppTheme.titleMediumStyle.copyWith(
                color: textColor,
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: enabled ? onTap : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: AppPalette.blackColor,
                        width: 1,
                      ),
                    ),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.45, 55),
                  ),
                  child: Text(
                    buttonText,
                    style: AppTheme.titleMediumStyle.copyWith(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
