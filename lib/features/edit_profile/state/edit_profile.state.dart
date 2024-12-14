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
  final List<LocationModel>? locationOptions;
  final List<SkillModel>? skillsOptions;
  final List<InterestModel>? interestsOptions;
  final List<FieldOfStudyModel>? fieldOfStudyOptions;
  final List<EducationLevelModel>? educationLevelOptions;
  final List<CollegeModel>? collegeOptions;
  final String? error;

  EditProfileState({
    this.isLoading = true,
    this.profile,
    this.locationOptions,
    this.skillsOptions,
    this.interestsOptions,
    this.fieldOfStudyOptions,
    this.educationLevelOptions,
    this.collegeOptions,
    this.error,
  });

  EditProfileState copyWith({
    bool? isLoading,
    EditProfileModel? profile,
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
