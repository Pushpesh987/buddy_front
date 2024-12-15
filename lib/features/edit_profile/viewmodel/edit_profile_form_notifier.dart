import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/edit_profile_form_state.dart';

final editProfileFormProvider = StateNotifierProvider<EditProfileFormNotifier, EditProfileFormState>((ref) {
  return EditProfileFormNotifier();
});

class EditProfileFormNotifier extends StateNotifier<EditProfileFormState> {
  EditProfileFormNotifier() : super(EditProfileFormState());

  void toggleEditMode() {
    state = state.copyWith(isEditable: !state.isEditable);
  }

  void updateField({
    String? gender,
    String? location,
    String? educationLevel,
    String? fieldOfStudy,
    String? collegeName,
    List<String>? selectedSkills,
    List<String>? selectedInterests,
    String? profilePicUrl,
  }) {
    state = state.copyWith(
      gender: gender ?? state.gender,
      location: location ?? state.location,
      educationLevel: educationLevel ?? state.educationLevel,
      fieldOfStudy: fieldOfStudy ?? state.fieldOfStudy,
      collegeName: collegeName ?? state.collegeName,
      selectedSkills: selectedSkills ?? state.selectedSkills,
      selectedInterests: selectedInterests ?? state.selectedInterests,
      profilePicUrl: profilePicUrl ?? state.profilePicUrl,
      isUpdated: true,
    );
  }

  void cancelEdit() {
    state = state.copyWith(
      isEditable: false,
      isUpdated: false,
      gender: null,
      location: null,
      educationLevel: null,
      fieldOfStudy: null,
      collegeName: null,
      selectedSkills: [],
      selectedInterests: [],
      profilePicUrl: null,
    );
  }
}
