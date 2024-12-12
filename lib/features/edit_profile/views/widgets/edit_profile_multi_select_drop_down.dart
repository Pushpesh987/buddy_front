import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

class EditProfileMultiSelectDropdown extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final List<String> selectedValues;
  final Widget? icon;
  final Function(List<String>) onChanged;

  const EditProfileMultiSelectDropdown({
    super.key,
    required this.hintText,
    this.icon,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
  });

  @override
  State<EditProfileMultiSelectDropdown> createState() => _EditProfileMultiSelectDropdownState();
}

class _EditProfileMultiSelectDropdownState extends State<EditProfileMultiSelectDropdown> {
  late List<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.selectedValues);
  }

  void _removeChip(String value) {
    setState(() {
      _selectedValues.remove(value);
    });
    widget.onChanged(_selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            final result = await showDialog<List<String>>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(widget.hintText),
                  content: SingleChildScrollView(
                    child: Column(
                      children: widget.options.map((String option) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return CheckboxListTile(
                              title: Text(option),
                              value: _selectedValues.contains(option),
                              onChanged: (bool? isSelected) {
                                setState(() {
                                  if (isSelected ?? false) {
                                    _selectedValues.add(option);
                                  } else {
                                    _selectedValues.remove(option);
                                  }
                                });
                              },
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, _selectedValues);
                      },
                      child: const Text('Done'),
                    ),
                  ],
                );
              },
            );
            if (result != null) {
              setState(() {
                _selectedValues = result;
              });
              widget.onChanged(_selectedValues);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              suffix: widget.icon,
              labelText: widget.hintText,
              labelStyle: AppTheme.bodyMediumStyle.copyWith(
                color: AppTheme.lightThemeMode.colorScheme.onSurface,
              ),
              hintText: _selectedValues.isEmpty ? widget.hintText : null,
              hintStyle: AppTheme.bodyMediumStyle.copyWith(
                color: AppTheme.lightThemeMode.colorScheme.onSurface,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            child: Text(widget.hintText),
          ),
        ),
        const SizedBox(height: 10),
        if (_selectedValues.isNotEmpty)
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _selectedValues
                .map((String value) => Chip(
                      backgroundColor: AppPalette.yellowColorAmberAccent,
                      label: Text(value),
                      deleteIcon: Icon(
                        Icons.close,
                        size: 16,
                        color: AppPalette.redColor1,
                      ),
                      onDeleted: () {
                        _removeChip(value);
                      },
                    ))
                .toList(),
          ),
      ],
    );
  }
}
