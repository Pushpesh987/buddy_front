import 'package:flutter/material.dart';

class ProjectTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int? maxLines;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const ProjectTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
