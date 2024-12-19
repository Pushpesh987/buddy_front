import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/user_model.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends AutoDisposeAsyncNotifier<UserModel> {
  Future<UserModel> fetchUserData() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/user', // Replace with the actual endpoint for fetching user data
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching user data: $error');
        },
        (data) {
          if (data['data'] == null) {
            throw Exception('No user data available');
          }

          return UserModel.fromJson(data['data']);
        },
      );
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  @override
  FutureOr<UserModel> build() async {
    state = const AsyncValue.loading();

    try {
      final user = await fetchUserData();
      state = AsyncValue.data(user);
      return user;
    } catch (e, stackTrace) {
      print("Error: $e, StackTrace: $stackTrace");
      state = AsyncValue.error('Error fetching user data: $e', stackTrace);
      return UserModel();
    }
  }
}
