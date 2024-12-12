import '../models/edit_profile_model.dart';

class EditProfileState {
  final EditProfileModel? profile;
  final bool isLoading;
  final String? error;

  EditProfileState({
    this.profile,
    this.isLoading = false,
    this.error,
  });

  EditProfileState copyWith({
    EditProfileModel? profile,
    bool? isLoading,
    String? error,
  }) {
    return EditProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
