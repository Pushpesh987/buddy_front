import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/joined_comunities_model.dart';

part 'joined_comunities_notifier.g.dart';

@riverpod
class JoinedComunitiesNotifier extends AutoDisposeAsyncNotifier<List<JoinedComunitiesModel>> {
  Future<List<JoinedComunitiesModel>> fetchJoinedCommunities() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/communities/user/joined',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching joined communities: $error');
        },
        (data) {
          final communitiesData = data['data'];

          if (communitiesData == null || !(communitiesData is List)) {
            return [];
          }

          final communities = communitiesData
              .map((item) {
                try {
                  return JoinedComunitiesModel.fromJson(item);
                } catch (e) {
                  return null;
                }
              })
              .where((community) => community != null)
              .toList();

          return communities.cast<JoinedComunitiesModel>();
        },
      );
    } catch (e) {
      throw Exception('Unexpected error fetching joined communities: $e');
    }
  }

  @override
  FutureOr<List<JoinedComunitiesModel>> build() async {
    state = const AsyncValue.loading();

    try {
      final communities = await fetchJoinedCommunities();
      state = AsyncValue.data(communities);
      return communities;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching communities: $e', stackTrace);
      return [];
    }
  }
}
