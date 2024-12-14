import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/college_model.dart';
import '../../models/edit_profile_model.dart';
import '../../models/education_level_model.dart';
import '../../models/field_of_study_model.dart';
import '../../models/interest_model.dart';
import '../../models/location_model.dart';
import '../../models/skill_model.dart';
import '../../state/edit_profile.state.dart';

part 'edit_profile_notifier.g.dart';

@riverpod
class EditProfileNotifier extends AutoDisposeAsyncNotifier<EditProfileState> {
  @override
  FutureOr<EditProfileState> build() async {
    EditProfileState profileState = await _fetchProfile();

    final locations = await fetchLocations();
    final skills = await fetchSkills();
    final interests = await fetchInterests();
    final fieldOfStudy = await fetchFieldOfStudy();
    final educationLevels = await fetchEducationLevels();
    final colleges = await fetchColleges();

    return profileState.copyWith(
      locationOptions: locations,
      skillsOptions: skills,
      interestsOptions: interests,
      fieldOfStudyOptions: fieldOfStudy,
      educationLevelOptions: educationLevels,
      collegeOptions: colleges,
    );
  }

  Future<EditProfileState> _fetchProfile() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/profile',
      );

      return response.fold(
        (error) {
          return EditProfileState(isLoading: false, error: error);
        },
        (data) {
          final profile = EditProfileModel.fromJson(data['data']);
          return EditProfileState(isLoading: false, profile: profile);
        },
      );
    } catch (e) {
      return EditProfileState(isLoading: false, error: 'Error: $e');
    }
  }

  Future<List<LocationModel>> fetchLocations() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/location',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching locations: $error');
        },
        (data) {
          final locations = (data['data'] as List).map((item) => LocationModel.fromJson(item)).toList();
          return locations;
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<SkillModel>> fetchSkills() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/skills',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching skills: $error');
        },
        (data) {
          final skills = (data['data'] as List).map((item) => SkillModel.fromJson(item)).toList();
          return skills;
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<InterestModel>> fetchInterests() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/interests',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching interests: $error');
        },
        (data) {
          final interests = (data['data'] as List).map((item) => InterestModel.fromJson(item)).toList();
          return interests;
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<FieldOfStudyModel>> fetchFieldOfStudy() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/fields-of-study',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching field of study: $error');
        },
        (data) {
          final fields = (data['data'] as List).map((item) => FieldOfStudyModel.fromJson(item)).toList();
          return fields;
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<EducationLevelModel>> fetchEducationLevels() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/education-level',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching education levels: $error');
        },
        (data) {
          final levels = (data['data'] as List).map((item) => EducationLevelModel.fromJson(item)).toList();
          return levels;
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<CollegeModel>> fetchColleges() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/college',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching colleges: $error');
        },
        (data) {
          final colleges = (data['data'] as List).map((item) => CollegeModel.fromJson(item)).toList();
          return colleges;
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<EditProfileState> updateProfile(EditProfileModel profileData) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      Map<String, dynamic> updatedData = _generateUpdatedData(profileData);

      if (updatedData.isNotEmpty) {
        final response = await apiService.request(
          HttpMethod.put,
          '/api/v1/users/profile',
          data: updatedData,
        );

        return response.fold(
          (error) {
            return EditProfileState(isLoading: false, error: error);
          },
          (_) async {
            return await _fetchProfile();
          },
        );
      } else {
        return EditProfileState(isLoading: false, error: 'No changes to update');
      }
    } catch (e) {
      return EditProfileState(isLoading: false, error: 'Error: $e');
    }
  }

  Map<String, dynamic> _generateUpdatedData(EditProfileModel profileData) {
    final Map<String, dynamic> updatedData = {};

    if (profileData.firstName != null) {
      updatedData['first_name'] = profileData.firstName;
    }
    if (profileData.lastName != null) {
      updatedData['last_name'] = profileData.lastName;
    }
    if (profileData.gender != null) {
      updatedData['gender'] = profileData.gender;
    }
    if (profileData.location != null) {
      updatedData['location'] = profileData.location;
    }
    if (profileData.educationLevel != null) {
      updatedData['education_level'] = profileData.educationLevel;
    }
    if (profileData.fieldOfStudy != null) {
      updatedData['field_of_study'] = profileData.fieldOfStudy;
    }
    if (profileData.collegeName != null) {
      updatedData['college_name'] = profileData.collegeName;
    }
    if (profileData.skills != null) {
      updatedData['skills'] = profileData.skills;
    }
    if (profileData.interests != null) {
      updatedData['interests'] = profileData.interests;
    }

    return updatedData;
  }
}
