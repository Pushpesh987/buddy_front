import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class EditProfileRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final Function(String?)? onChanged;
  final bool enabled;

  const EditProfileRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = groupValue == value;

    return GestureDetector(
      onTap: enabled && onChanged != null ? () => onChanged!(value) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppPalette.yellowColor : AppPalette.disableTextGreyColor,
            width: 2,
          ),
          color: isSelected ? AppPalette.yellowColorShade100 : AppPalette.transparentColor,
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: enabled ? onChanged : null,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppPalette.yellowColorAmberAccent : AppPalette.disableTextGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
