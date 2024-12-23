import 'dart:async';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';

part 'all_comunities_joined_notifier.g.dart';

@riverpod
class AllComunitiesJoinedNotifier extends AutoDisposeAsyncNotifier<void> {
  Future<Either<String, void>> joinCommunity(int id) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.post,
        '/api/v1/communities/$id/join',
        data: {'id': id},
      );

      return response.fold(
        (error) {
          return Left('Error joining community: $error');
        },
        (data) {
          return const Right(null);
        },
      );
    } catch (e) {
      return Left('Unexpected error joining community: $e');
    }
  }

  @override
  FutureOr<void> build() async {
    state = const AsyncValue.loading();
  }
}
