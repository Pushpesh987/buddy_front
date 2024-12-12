import 'package:flutter/material.dart';

import 'edit_profile_custom_field.dart';

class EditProfileDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;

  const EditProfileDatePicker({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime initialDate = DateTime(currentDate.year - 18);
    final DateTime firstDate = DateTime(currentDate.year - 100);
    final DateTime lastDate = currentDate;

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != initialDate) {
      final formattedDate = "${selectedDate.toLocal()}".split(' ')[0];
      controller.text = formattedDate;

      if (onChanged != null) {
        onChanged!(formattedDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: EditProfileCustomField(
          isFloatingLabel: false,
          hintText: hintText,
          controller: controller,
        ),
      ),
    );
  }
}
