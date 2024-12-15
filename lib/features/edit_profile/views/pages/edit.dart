// import 'dart:io';
// import 'package:buddy_front/core/helpers/failure.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../../core/helpers/format_date.dart';
// import '../../../../core/helpers/hide_keyboard.dart';
// import '../../../../core/helpers/loading.dart';
// import '../../../../core/theme/app_pallete.dart';
// import '../../../../core/theme/theme.dart';
// import '../../models/edit_profile_model.dart';
// import '../../state/edit_profile.state.dart';
// import '../../viewmodel/providers/edit_profile_notifier.dart';
// import '../widgets/edit_profile_app_bar.dart';
// import '../widgets/edit_profile_button.dart';
// import '../widgets/edit_profile_custom_field.dart';
// import '../widgets/edit_profile_date_picker.dart';
// import '../widgets/edit_profile_image_picker.dart';
// import '../widgets/edit_profile_multi_select_drop_down.dart';
// import '../widgets/edit_profile_radio.dart';

// class EditProfilePage extends ConsumerStatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends ConsumerState<EditProfilePage> {
//   File? _selectedImage;
//   String? _gender = 'Male';
//   String? _location;
//   String? _educationLevel;
//   String? _fieldOfStudy;
//   String? _collegeName;
//   List<String> _selectedSkills = [];
//   List<String> _selectedInterests = [];
//   String? _profilePicUrl;

//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final dobController = TextEditingController();

//   List<String> locationOptions = [];
//   List<String> educationLevels = [];
//   List<String> fieldOfStudyOptions = [];
//   List<String> collegeOptions = [];
//   List<String> skillsOptions = [];
//   List<String> interestsOptions = [];

//   bool isEditing = false;

//   String? _initialFirstName;
//   String? _initialLastName;

//   @override
//   void initState() {
//     super.initState();
//     firstNameController.addListener(() {});
//     lastNameController.addListener(() {});
//     dobController.addListener(() {});

//     final profileState = ref.read(editProfileNotifierProvider);

//     profileState.when(
//       data: (state) {
//         if (state.profile != null) {
//           final profile = state.profile;
//           _initialFirstName = profile?.firstName;
//           _initialLastName = profile?.lastName;

//           firstNameController.text = _initialFirstName ?? '';
//           lastNameController.text = _initialLastName ?? '';
//         }
//       },
//       loading: () {},
//       error: (error, stackTrace) {},
//     );
//   }

//   void _toggleEditMode() {
//     setState(() {
//       isEditing = !isEditing;
//     });
//   }

//   void _cancelChanges() {
//     setState(() {
//       isEditing = false;
//       firstNameController.text = _initialFirstName ?? '';
//       lastNameController.text = _initialLastName ?? '';
//     });
//   }

//   void _saveChanges() {
//     setState(() {
//       isEditing = false;
//       _initialFirstName = firstNameController.text;
//       _initialLastName = lastNameController.text;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
//     final profileState = ref.watch(editProfileNotifierProvider);

//     return GestureDetector(
//       onTap: () => hideKeyboard(context),
//       behavior: HitTestBehavior.opaque,
//       child: Scaffold(
//         body: profileState.when(
//           data: (state) {
//             final profile = state.profile;
//             _initialFirstName = profile?.firstName;
//             _initialLastName = profile?.lastName;

//             // Initialize text controllers with the initial values
//             firstNameController.text = _initialFirstName ?? '';
//             lastNameController.text = _initialLastName ?? '';
//             // EditProfileModel? profile = state.profile;
//             // firstNameController.text = profile?.firstName ?? '';
//             // lastNameController.text = profile?.lastName ?? '';
//             _gender = profile?.gender ?? 'Male';
//             _location = profile?.location;
//             _educationLevel = profile?.educationLevel;
//             _fieldOfStudy = profile?.fieldOfStudy;
//             _collegeName = profile?.collegeName;
//             _profilePicUrl = profile?.profilePhotoUrl ?? 'assets/images/profile.png';
//             _selectedSkills = profile?.skills ?? [];
//             _selectedInterests = profile?.interests ?? [];
//             dobController.text = formatDate(profile?.dob ?? '');

//             locationOptions =
//                 state.locationOptions!.map((location) => location.locationName ?? 'Unknown Location').toList();
//             educationLevels = state.educationLevelOptions!.map((level) => level.fieldName ?? 'Unknown Level').toList();
//             fieldOfStudyOptions =
//                 state.fieldOfStudyOptions!.map((field) => field.levelName ?? 'Unknown Field').toList();
//             collegeOptions = state.collegeOptions!.map((college) => college.collegeName ?? 'Unknown College').toList();
//             skillsOptions = state.skillsOptions!.map((skill) => skill.skillName ?? 'Unknown Skill').toList();
//             interestsOptions =
//                 state.interestsOptions!.map((interest) => interest.interestName ?? 'Unknown Interest').toList();

//             return Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       EditProfileAppBar(
//                         title: 'Profile',
//                         onBackButtonPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       EditProfileImagePicker(
//                         size: 120,
//                         defaultImagePath: 'assets/images/profile.png',
//                         imageUrl: _selectedImage != null ? _selectedImage!.path : _profilePicUrl,
//                         uploadIconPath: 'assets/icons/image_upload.svg',
//                         onImagePicked: (file) {
//                           setState(() {
//                             _selectedImage = file;
//                           });
//                         },
//                         enabled: isEditing,
//                       ),
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: EditProfileCustomField(
//                                     hintText: 'First Name',
//                                     controller: firstNameController,
//                                     enabled: isEditing,
//                                     onChanged: isEditing
//                                         ? (value) {
//                                             setState(() {
//                                               firstNameController.text = value ?? '';
//                                             });
//                                           }
//                                         : null,
//                                   ),
//                                 ),
//                                 SizedBox(height:500),
//                               ],
//                             ),
//                                 const SizedBox(width: 20.0),
//                                 Expanded(
//                                   child: EditProfileCustomField(
//                                     hintText: 'Last Name',
//                                     controller: lastNameController,
//                                     enabled: isEditing,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 30.0),
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Gender',
//                                 style: AppTheme.titleMediumStyle.copyWith(
//                                   color: AppTheme.lightThemeMode.colorScheme.onSurface,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 10.0),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: EditProfileRadio(
//                                     value: 'Male',
//                                     groupValue: _gender!,
//                                     label: 'Male',
//                                     onChanged: isEditing
//                                         ? (value) => setState(() {
//                                               _gender = value;
//                                             })
//                                         : null,
//                                     enabled: isEditing,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10.0),
//                                 Expanded(
//                                   child: EditProfileRadio(
//                                     value: 'Female',
//                                     groupValue: _gender!,
//                                     label: 'Female',
//                                     onChanged: isEditing
//                                         ? (value) => setState(() {
//                                               _gender = value;
//                                             })
//                                         : null,
//                                     enabled: isEditing,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10.0),
//                                 Expanded(
//                                   child: EditProfileRadio(
//                                     value: 'Others',
//                                     groupValue: _gender!,
//                                     label: 'Others',
//                                     onChanged: isEditing
//                                         ? (value) => setState(() {
//                                               _gender = value;
//                                             })
//                                         : null,
//                                     enabled: isEditing,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             if (_gender == 'Others')
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 16.0),
//                                 child: EditProfileCustomField(
//                                   controller: TextEditingController(text: _gender),
//                                   hintText: 'Gender Specified',
//                                   enabled: isEditing,
//                                 ),
//                               ),
//                             const SizedBox(height: 25),
//                             EditProfileDatePicker(
//                               controller: dobController,
//                               hintText: 'Date of Birth',
//                               onChanged: null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 25),
//                             EditProfileCustomField(
//                               hintText: 'Location',
//                               isDropdown: true,
//                               dropdownOptions: locationOptions,
//                               selectedValue: _location,
//                               onChanged: isEditing
//                                   ? (value) {
//                                       setState(() {
//                                         _location = value;
//                                       });
//                                     }
//                                   : null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 20),
//                             EditProfileCustomField(
//                               hintText: 'Education Level',
//                               isDropdown: true,
//                               dropdownOptions: fieldOfStudyOptions,
//                               selectedValue: _educationLevel,
//                               onChanged: isEditing
//                                   ? (value) {
//                                       setState(() {
//                                         _educationLevel = value;
//                                       });
//                                     }
//                                   : null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 20),
//                             EditProfileCustomField(
//                               hintText: 'Field of Study',
//                               isDropdown: true,
//                               dropdownOptions: educationLevels,
//                               selectedValue: _fieldOfStudy,
//                               onChanged: isEditing
//                                   ? (value) {
//                                       setState(() {
//                                         _fieldOfStudy = value;
//                                       });
//                                     }
//                                   : null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 20),
//                             EditProfileCustomField(
//                               hintText: 'College Name',
//                               isDropdown: true,
//                               dropdownOptions: collegeOptions,
//                               selectedValue: _collegeName,
//                               onChanged: isEditing
//                                   ? (value) {
//                                       setState(() {
//                                         _collegeName = value;
//                                       });
//                                     }
//                                   : null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 25),
//                             EditProfileMultiSelectDropdown(
//                               icon: SvgPicture.asset(
//                                 'assets/icons/skill.svg',
//                                 width: 25,
//                                 height: 25,
//                                 colorFilter: const ColorFilter.mode(
//                                   Colors.black,
//                                   BlendMode.srcIn,
//                                 ),
//                               ),
//                               hintText: 'Skills',
//                               options: skillsOptions,
//                               selectedValues: _selectedSkills,
//                               onChanged: null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 12),
//                             EditProfileMultiSelectDropdown(
//                               icon: SvgPicture.asset(
//                                 'assets/icons/interests.svg',
//                                 width: 25,
//                                 height: 25,
//                                 colorFilter: const ColorFilter.mode(
//                                   Colors.black,
//                                   BlendMode.srcIn,
//                                 ),
//                               ),
//                               hintText: 'Interests',
//                               options: interestsOptions,
//                               selectedValues: _selectedInterests,
//                               onChanged: null,
//                               enabled: isEditing,
//                             ),
//                             const SizedBox(height: 100),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//           },
//                 Visibility(
//                   visible: !keyboardVisible,
//                   child: Positioned(
//                     bottom: 0.01,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 4,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: isEditing
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: EditProfileButton(
//                                     buttonText: 'Cancel',
//                                     onTap: _cancelChanges,
//                                     buttonColor: Colors.grey,
//                                     textColor: Colors.white,
//                                   ),
//                                 ),
//                                 // Save button
//                                 Expanded(
//                                   child: EditProfileButton(
//                                     buttonText: 'Save',
//                                     onTap: _saveChanges,
//                                     buttonColor: AppPalette.yellowColor,
//                                     textColor: AppPalette.blackColor,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           : EditProfileButton(
//                               buttonText: 'Edit',
//                               onTap: _toggleEditMode,
//                               buttonColor: AppPalette.yellowColor,
//                               textColor: AppPalette.blackColor,
//                             ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//           loading: () => buildLoadingIndicator(),
//           error: (error, stackTrace) {
//             String errorMessage = 'An unexpected error occurred';

//             if (error is Failure) {
//               errorMessage = error.message;
//             } else if (error is String) {
//               errorMessage = error;
//             }
//             showError(context, errorMessage);
//             return null;
//           },
//         ),
//       ),
//     );
//   }
// }
