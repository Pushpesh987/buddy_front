import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/hide_keyboard.dart';
import '../../../../core/helpers/loading.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../viewmodel/providers/edit_profile_notifier.dart';
import '../widgets/edit_profile_app_bar.dart';
import '../widgets/edit_profile_button.dart';
import '../widgets/edit_profile_custom_field.dart';
import '../../models/edit_profile_model.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  bool isEditing = false;

  String? _initialFirstName;
  String? _initialLastName;

  @override
  void initState() {
    super.initState();
  }

  void _toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _cancelChanges() {
    setState(() {
      isEditing = false;
      firstNameController.text = _initialFirstName ?? '';
      lastNameController.text = _initialLastName ?? '';
    });
  }

  void _saveChanges() async {
    if (firstNameController.text == _initialFirstName && lastNameController.text == _initialLastName) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No changes to save')),
      );
      return;
    }

    final updatedProfile = EditProfileModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );

    setState(() {
      isEditing = false;
    });

    final result = await ref.read(editProfileNotifierProvider.notifier).updateProfile(updatedProfile);

    if (result.isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saving...')),
      );
    } else if (result.error != null) {
      final errorMessage = result.error!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $errorMessage')),
      );
    } else if (result.profile != null) {
      setState(() {
        _initialFirstName = firstNameController.text;
        _initialLastName = lastNameController.text;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(editProfileNotifierProvider);

    profileState.when(
      data: (state) {
        if (state.profile != null) {
          final profile = state.profile;
          if (_initialFirstName == null || _initialLastName == null) {
            _initialFirstName = profile?.firstName;
            _initialLastName = profile?.lastName;
            firstNameController.text = _initialFirstName ?? '';
            lastNameController.text = _initialLastName ?? '';
          }
        }
      },
      loading: () {},
      error: (error, stackTrace) {},
    );

    bool isModified = firstNameController.text != _initialFirstName || lastNameController.text != _initialLastName;

    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return GestureDetector(
      onTap: () => hideKeyboard(context),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: profileState.isLoading
            ? buildLoadingIndicator()
            : profileState.error != null
                ? Center(child: Text('Error: ${profileState.error}'))
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            EditProfileAppBar(
                              title: 'Profile',
                              onBackButtonPressed: () {
                                Navigator.of(context).pop();
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
                                          enabled: isEditing,
                                          onChanged: isEditing
                                              ? (value) {
                                                  setState(() {
                                                    firstNameController.text = value ?? '';
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: EditProfileCustomField(
                                          hintText: 'Last Name',
                                          controller: lastNameController,
                                          enabled: isEditing,
                                          onChanged: isEditing
                                              ? (value) {
                                                  setState(() {
                                                    lastNameController.text = value ?? '';
                                                  });
                                                }
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 500),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !keyboardVisible,
                        child: Positioned(
                          bottom: 0.01,
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
                            child: isEditing
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: EditProfileButton(
                                          buttonText: 'Cancel',
                                          onTap: _cancelChanges,
                                          buttonColor: Colors.grey,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: EditProfileButton(
                                          buttonText: 'Save',
                                          onTap: _saveChanges,
                                          buttonColor: isModified ? AppPalette.yellowColor : Colors.grey,
                                          textColor: AppPalette.blackColor,
                                        ),
                                      ),
                                    ],
                                  )
                                : EditProfileButton(
                                    buttonText: 'Edit',
                                    onTap: _toggleEditMode,
                                    buttonColor: AppPalette.yellowColor,
                                    textColor: AppPalette.blackColor,
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
