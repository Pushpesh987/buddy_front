import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/all_comunities_model.dart';

part 'all_comunities_notifier.g.dart';

@riverpod
class AllComunitiesNotifier extends AutoDisposeAsyncNotifier<List<AllComunitiesModel>> {
  Future<List<AllComunitiesModel>> fetchAllCommunities() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/communities/',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching communities: $error');
        },
        (data) {
          final communitiesData = data['data'];

          if (communitiesData == null || !(communitiesData is List)) {
            return [];
          }

          final communities = communitiesData
              .map((item) {
                try {
                  return AllComunitiesModel.fromJson(item);
                } catch (e) {
                  return null;
                }
              })
              .where((community) => community != null)
              .toList();

          return communities.cast<AllComunitiesModel>();
        },
      );
    } catch (e) {
      throw Exception('Unexpected error fetching communities: $e');
    }
  }

  @override
  FutureOr<List<AllComunitiesModel>> build() async {
    state = const AsyncValue.loading();

    try {
      final communities = await fetchAllCommunities();
      state = AsyncValue.data(communities);
      return communities;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching communities: $e', stackTrace);
      return [];
    }
  }
}
