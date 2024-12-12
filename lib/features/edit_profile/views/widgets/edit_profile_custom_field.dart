import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class EditProfileCustomField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isObscuredText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool isFloatingLabel;
  final bool isDropdown;
  final List<String>? dropdownOptions;
  final String? selectedValue;
  final Function(String?)? onChanged;

  const EditProfileCustomField({
    super.key,
    required this.hintText,
    this.controller,
    this.isObscuredText = false,
    this.focusNode,
    this.validator,
    this.isFloatingLabel = true,
    this.isDropdown = false,
    this.dropdownOptions,
    this.selectedValue,
    this.onChanged,
  });

  @override
  State<EditProfileCustomField> createState() => _EditProfileCustomFieldState();
}

class _EditProfileCustomFieldState extends State<EditProfileCustomField> {
  late bool _isObscuredText;
  FocusNode? _internalFocusNode;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _isObscuredText = widget.isObscuredText;
    _internalFocusNode = widget.focusNode ?? FocusNode();
    _internalFocusNode?.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _internalFocusNode?.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_internalFocusNode?.hasFocus ?? false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToEnd();
      });
    } else {
      _resetTextScroll();
    }
  }

  void _scrollToEnd() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOut,
      );
    }
  }

  void _resetTextScroll() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOut,
      );
    }
  }

  void _toggleVisibility() {
    setState(() {
      _isObscuredText = !_isObscuredText;
    });
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: AppTheme.bodyMediumStyle.copyWith(
          color: AppTheme.lightThemeMode.colorScheme.onSurface,
        ),
        border: OutlineInputBorder(),
      ),
      items: widget.dropdownOptions!.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      isExpanded: true,
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      style: AppTheme.bodyLargeStyle.copyWith(
        color: AppTheme.lightThemeMode.colorScheme.onSurface,
      ),
      controller: widget.controller,
      obscureText: _isObscuredText,
      focusNode: _internalFocusNode,
      scrollController: _scrollController,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.isFloatingLabel ? widget.hintText : null,
        hintText: widget.isFloatingLabel ? null : widget.hintText,
        labelStyle: AppTheme.bodyMediumStyle.copyWith(
          color: AppTheme.lightThemeMode.colorScheme.onSurface,
        ),
        hintStyle: AppTheme.bodyMediumStyle.copyWith(
          color: AppTheme.lightThemeMode.colorScheme.onSurface,
        ),
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
        floatingLabelBehavior: widget.isFloatingLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDropdown ? _buildDropdown() : _buildTextFormField();
  }
}
