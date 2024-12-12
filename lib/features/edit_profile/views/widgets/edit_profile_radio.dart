import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class EditProfileRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final Function(String?) onChanged;

  const EditProfileRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: groupValue == value ? AppPalette.yellowColor : AppPalette.disableTextGreyColor,
            width: 2,
          ),
          color: groupValue == value ? AppPalette.yellowColorShade100 : AppPalette.transparentColor,
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}
