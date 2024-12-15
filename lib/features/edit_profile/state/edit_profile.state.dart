import '../models/college_model.dart';
import '../models/edit_profile_model.dart';
import '../models/education_level_model.dart';
import '../models/field_of_study_model.dart';
import '../models/interest_model.dart';
import '../models/location_model.dart';
import '../models/skill_model.dart';

class EditProfileState {
  final bool isLoading;
  final EditProfileModel? profile;
  final String? gender;
  final String? location;
  final String? educationLevel;
  final String? fieldOfStudy;
  final String? collegeName;
  final List<String>? selectedSkills;
  final List<String>? selectedInterests;
  final String? profilePhotoUrl;
  final List<LocationModel>? locationOptions;
  final List<SkillModel>? skillsOptions;
  final List<InterestModel>? interestsOptions;
  final List<FieldOfStudyModel>? fieldOfStudyOptions;
  final List<EducationLevelModel>? educationLevelOptions;
  final List<CollegeModel>? collegeOptions;
  final String? error;

  const EditProfileState({
    this.isLoading = true,
    this.profile,
    this.gender,
    this.location,
    this.educationLevel,
    this.fieldOfStudy,
    this.collegeName,
    this.selectedSkills = const [],
    this.selectedInterests = const [],
    this.profilePhotoUrl,
    this.locationOptions = const [],
    this.skillsOptions = const [],
    this.interestsOptions = const [],
    this.fieldOfStudyOptions = const [],
    this.educationLevelOptions = const [],
    this.collegeOptions = const [],
    this.error,
  });

  EditProfileState copyWith({
    bool? isLoading,
    EditProfileModel? profile,
    String? gender,
    String? location,
    String? educationLevel,
    String? fieldOfStudy,
    String? collegeName,
    List<String>? selectedSkills,
    List<String>? selectedInterests,
    String? profilePhotoUrl,
    List<LocationModel>? locationOptions,
    List<SkillModel>? skillsOptions,
    List<InterestModel>? interestsOptions,
    List<FieldOfStudyModel>? fieldOfStudyOptions,
    List<EducationLevelModel>? educationLevelOptions,
    List<CollegeModel>? collegeOptions,
    String? error,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      educationLevel: educationLevel ?? this.educationLevel,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      collegeName: collegeName ?? this.collegeName,
      selectedSkills: selectedSkills ?? this.selectedSkills,
      selectedInterests: selectedInterests ?? this.selectedInterests,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      locationOptions: locationOptions ?? this.locationOptions,
      skillsOptions: skillsOptions ?? this.skillsOptions,
      interestsOptions: interestsOptions ?? this.interestsOptions,
      fieldOfStudyOptions: fieldOfStudyOptions ?? this.fieldOfStudyOptions,
      educationLevelOptions: educationLevelOptions ?? this.educationLevelOptions,
      collegeOptions: collegeOptions ?? this.collegeOptions,
      error: error ?? this.error,
    );
  }
}
