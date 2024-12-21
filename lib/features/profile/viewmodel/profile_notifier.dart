import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/profile_model.dart';

part 'profile_notifier.g.dart';

@riverpod
class ProfileNotifier extends AutoDisposeAsyncNotifier<ProfileModel> {
  Future<ProfileModel> fetchProfile() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/users/profile',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching profile: $error');
        },
        (data) {
          final profileData = data['data'];

          if (profileData == null) {
            throw Exception('Profile data is missing');
          }

          return ProfileModel.fromJson(profileData);
        },
      );
    } catch (e) {
      throw Exception('Unexpected error fetching profile: $e');
    }
  }

  @override
  FutureOr<ProfileModel> build() async {
    state = const AsyncValue.loading();

    try {
      final profile = await fetchProfile();
      state = AsyncValue.data(profile);
      return profile;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching profile: $e', stackTrace);
      rethrow;
    }
  }
}
