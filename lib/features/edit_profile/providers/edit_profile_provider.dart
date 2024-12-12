import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/providers/auth_providers.dart';
import '../state/edit_profile.state.dart';
import '../view_model/edit_profile_view_model.dart';

final editProfileViewModelProvider = StateNotifierProvider<EditProfileViewModel, EditProfileState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return EditProfileViewModel(apiService);
});
