import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api_service/api_service.dart';
import '../models/edit_profile_model.dart';
import '../state/edit_profile.state.dart';

class EditProfileViewModel extends StateNotifier<EditProfileState> {
  final ApiService _apiService;

  EditProfileViewModel(this._apiService) : super(EditProfileState());

  Future<void> fetchProfileData() async {
    state = state.copyWith(isLoading: true);
    final response = await _apiService.request(
      HttpMethod.get,
      '/profile',
    );

    response.fold(
      (error) {
        state = state.copyWith(isLoading: false, error: error);
      },
      (data) {
        state = state.copyWith(
          isLoading: false,
          profile: EditProfileModel.fromJson(data),
        );
      },
    );
  }

  Future<void> updateProfile(EditProfileModel profileData) async {
    state = state.copyWith(isLoading: true);
    final response = await _apiService.request(
      HttpMethod.put,
      '/profile',
      data: profileData.toJson(),
    );

    response.fold(
      (error) {
        state = state.copyWith(isLoading: false, error: error);
      },
      (_) {
        state = state.copyWith(isLoading: false);
        fetchProfileData();
      },
    );
  }
}
