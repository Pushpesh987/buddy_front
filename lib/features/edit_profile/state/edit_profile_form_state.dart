class EditProfileFormState {
  final bool isEditable;
  final bool isUpdated;
  final String? gender;
  final String? location;
  final String? educationLevel;
  final String? fieldOfStudy;
  final String? collegeName;
  final List<String> selectedSkills;
  final List<String> selectedInterests;
  final String? profilePicUrl;

  const EditProfileFormState({
    this.isEditable = false,
    this.isUpdated = false,
    this.gender,
    this.location,
    this.educationLevel,
    this.fieldOfStudy,
    this.collegeName,
    this.selectedSkills = const [],
    this.selectedInterests = const [],
    this.profilePicUrl,
  });

  EditProfileFormState copyWith({
    bool? isEditable,
    bool? isUpdated,
    String? gender,
    String? location,
    String? educationLevel,
    String? fieldOfStudy,
    String? collegeName,
    List<String>? selectedSkills,
    List<String>? selectedInterests,
    String? profilePicUrl,
  }) {
    return EditProfileFormState(
      isEditable: isEditable ?? this.isEditable,
      isUpdated: isUpdated ?? this.isUpdated,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      educationLevel: educationLevel ?? this.educationLevel,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      collegeName: collegeName ?? this.collegeName,
      selectedSkills: selectedSkills ?? this.selectedSkills,
      selectedInterests: selectedInterests ?? this.selectedInterests,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
    );
  }
}
