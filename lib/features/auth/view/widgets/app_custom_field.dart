import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class AuthCustomField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscuredText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  const AuthCustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscuredText = false,
    this.focusNode,
    this.validator,
  });

  @override
  State<AuthCustomField> createState() => _AuthCustomFieldState();
}

class _AuthCustomFieldState extends State<AuthCustomField> {
  late bool _isObscuredText;
  FocusNode? _internalFocusNode;

  @override
  void initState() {
    super.initState();
    _isObscuredText = widget.isObscuredText;
    _internalFocusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode?.dispose();
    }
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _isObscuredText = !_isObscuredText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTheme.titleMediumStyle.copyWith(
        color: AppTheme.lightThemeMode.colorScheme.onSurface,
      ),
      controller: widget.controller,
      obscureText: _isObscuredText,
      focusNode: _internalFocusNode,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: AppTheme.lightThemeMode.inputDecorationTheme.enabledBorder,
        focusedBorder: AppTheme.lightThemeMode.inputDecorationTheme.focusedBorder,
        errorBorder: AppTheme.lightThemeMode.inputDecorationTheme.errorBorder,
        focusedErrorBorder: AppTheme.lightThemeMode.inputDecorationTheme.focusedErrorBorder,
        suffixIcon: widget.isObscuredText
            ? IconButton(
                icon: Icon(
                  _isObscuredText ? Icons.visibility_off : Icons.visibility,
                  color: _isObscuredText
                      ? AppTheme.lightThemeMode.colorScheme.onSurface
                      : AppTheme.lightThemeMode.primaryColor,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }
}
