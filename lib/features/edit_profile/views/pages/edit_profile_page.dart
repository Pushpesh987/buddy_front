import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/hide_keyboard.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/theme.dart';
import '../widgets/edit_profile_app_bar.dart';
import '../widgets/edit_profile_custom_field.dart';
import '../widgets/edit_profile_date_picker.dart';
import '../widgets/edit_profile_image_picker.dart';
import '../widgets/edit_profile_multi_select_drop_down.dart';
import '../widgets/edit_profile_radio.dart';
import '../widgets/edit_profile_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _selectedImage;

  String? _gender = 'Male';
  String? _location;
  String? _educationLevel;
  String? _fieldOfStudy;
  String? _collegeName;
  List<String> _skillsOptions = [];
  List<String> _interestsOptions = [];

  final firstNameController = TextEditingController();
  final firstNameFocusNode = FocusNode();
  final lastNameController = TextEditingController();
  final lastNameFocusNode = FocusNode();
  final otherGenderController = TextEditingController();
  final dobController = TextEditingController();

  bool _isUpdated = false;

  final _formKey = GlobalKey<FormState>();

  final List<String> locationOptions = ['New York', 'Los Angeles', 'Chicago'];
  final List<String> educationLevels = ['High School', 'Bachelor', 'Master', 'PhD'];
  final List<String> fieldOfStudyOptions = ['Computer Science', 'Business', 'Engineering', 'Arts'];
  final List<String> collegeOptions = ['Harvard', 'MIT', 'Stanford', 'University of California'];
  final List<String> skillsOptions = ['Flutter', 'Dart', 'Python', 'Java', 'JavaScript'];
  final List<String> interestsOptions = ['App Development', 'Web Development', 'ROS'];

  @override
  void initState() {
    super.initState();
    firstNameFocusNode.addListener(() {
      setState(() {});
    });
    lastNameFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    firstNameFocusNode.dispose();
    lastNameController.dispose();
    lastNameFocusNode.dispose();
    otherGenderController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void _onFieldUpdated() {
    setState(() {
      _isUpdated = true;
    });
  }

  void _resetUpdateFlag() {
    setState(() {
      _isUpdated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return GestureDetector(
      onTap: () => hideKeyboard(context),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  EditProfileAppBar(
                    title: 'Edit Profile',
                    onBackButtonPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 20),
                  EditProfileImagePicker(
                    size: 120,
                    defaultImagePath: 'assets/images/profile.png',
                    uploadIconPath: 'assets/icons/image_upload.svg',
                    onImagePicked: (file) {
                      setState(() {
                        _selectedImage = file;
                        _onFieldUpdated();
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: EditProfileCustomField(
                                hintText: 'First Name',
                                controller: firstNameController,
                                focusNode: firstNameFocusNode,
                                validator: null,
                                onChanged: (value) {
                                  ///TODO not updating the field
                                  _onFieldUpdated();
                                },
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: EditProfileCustomField(
                                hintText: 'Last Name',
                                controller: lastNameController,
                                focusNode: lastNameFocusNode,
                                validator: null,
                                onChanged: (value) {
                                  ///TODO not updating the field
                                  _onFieldUpdated();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Gender',
                            style: AppTheme.titleMediumStyle.copyWith(
                              color: AppTheme.lightThemeMode.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: EditProfileRadio(
                                value: 'Male',
                                groupValue: _gender!,
                                label: 'Male',
                                onChanged: (String? value) {
                                  setState(() {
                                    _gender = value;
                                    _onFieldUpdated();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: EditProfileRadio(
                                value: 'Female',
                                groupValue: _gender!,
                                label: 'Female',
                                onChanged: (String? value) {
                                  setState(() {
                                    _gender = value;
                                    _onFieldUpdated();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: EditProfileRadio(
                                value: 'Others',
                                groupValue: _gender!,
                                label: 'Others',
                                onChanged: (String? value) {
                                  setState(() {
                                    _gender = value;
                                    _onFieldUpdated();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        if (_gender == 'Others')
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: EditProfileCustomField(
                                controller: otherGenderController,
                                hintText: 'Please Specify your gender',
                                onChanged: (String? value) {
                                  setState(() {
                                    _gender = value;
                                    if (_gender != 'Others') {
                                      otherGenderController.clear();
                                    }
                                    _onFieldUpdated();
                                  });
                                }),
                          ),
                        const SizedBox(height: 25),
                        EditProfileDatePicker(
                          controller: dobController,
                          hintText: '2000-01-01',
                          onChanged: (value) {
                            _onFieldUpdated();
                          },
                        ),
                        const SizedBox(height: 25),
                        EditProfileCustomField(
                          hintText: 'Location',
                          isDropdown: true,
                          dropdownOptions: locationOptions,
                          selectedValue: _location,
                          onChanged: (value) {
                            setState(() {
                              _location = value;
                              _onFieldUpdated();
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        EditProfileCustomField(
                          hintText: 'Education Level',
                          isDropdown: true,
                          dropdownOptions: educationLevels,
                          selectedValue: _educationLevel,
                          onChanged: (value) {
                            setState(() {
                              _educationLevel = value;
                              _onFieldUpdated();
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        EditProfileCustomField(
                          hintText: 'Field of Study',
                          isDropdown: true,
                          dropdownOptions: fieldOfStudyOptions,
                          selectedValue: _fieldOfStudy,
                          onChanged: (value) {
                            setState(() {
                              _fieldOfStudy = value;
                              _onFieldUpdated();
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        EditProfileCustomField(
                          hintText: 'College Name',
                          isDropdown: true,
                          dropdownOptions: collegeOptions,
                          selectedValue: _collegeName,
                          onChanged: (value) {
                            setState(() {
                              _collegeName = value;
                              _onFieldUpdated();
                            });
                          },
                        ),
                        const SizedBox(height: 25),
                        EditProfileMultiSelectDropdown(
                          icon: SvgPicture.asset(
                            'assets/icons/skill.svg',
                            width: 25,
                            height: 25,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          hintText: 'Skills',
                          options: skillsOptions,
                          selectedValues: _skillsOptions,
                          onChanged: (value) {
                            setState(() {
                              _skillsOptions = value;
                              _onFieldUpdated();
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        EditProfileMultiSelectDropdown(
                          icon: SvgPicture.asset(
                            'assets/icons/interests.svg',
                            width: 25,
                            height: 25,
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          hintText: 'Interests',
                          options: interestsOptions,
                          selectedValues: _interestsOptions,
                          onChanged: (value) {
                            setState(() {
                              _interestsOptions = value;
                              _onFieldUpdated();
                            });
                          },
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !keyboardVisible,
              child: Positioned(
                bottom: 1,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: EditProfileButton(
                    buttonText: _isUpdated ? 'Save Changes' : 'No Changes',
                    onTap: _isUpdated
                        ? () {
                            _resetUpdateFlag();
                          }
                        : () {
                            print('no updates');
                          },
                    buttonColor: _isUpdated ? AppPalette.yellowColor : Colors.grey,
                    textColor: _isUpdated ? AppPalette.blackColor : Colors.grey[600]!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
