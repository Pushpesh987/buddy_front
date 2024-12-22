import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/feed_post.dart';

part 'feed_post_notifier.g.dart';

@riverpod
class FeedPostNotifier extends _$FeedPostNotifier {
  Future<List<FeedPost>> fetchFeedPosts() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/feed/',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching feed posts: $error');
        },
        (data) {
          final feedPostsData = data['data'];

          if (feedPostsData == null || feedPostsData is! List) {
            return [];
          }

          final feedPosts = feedPostsData
              .map((item) {
                try {
                  return FeedPost.fromJson(item);
                } catch (e) {
                  return null;
                }
              })
              .where((post) => post != null)
              .toList();

          return feedPosts.cast<FeedPost>();
        },
      );
    } catch (e) {
      throw Exception('Unexpected error fetching feed posts: $e');
    }
  }

  @override
  FutureOr<List<FeedPost>> build() async {
    state = const AsyncLoading();

    try {
      final feedPosts = await fetchFeedPosts();
      state = AsyncValue.data(feedPosts);
      return feedPosts;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching feed posts: $e', stackTrace);
      return [];
    }
  }
}
