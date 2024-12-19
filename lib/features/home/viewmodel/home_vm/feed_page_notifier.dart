import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/feed_post.dart';

final feedPageProvider = FutureProvider<List<FeedPost>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);

  try {
    final response = await apiService.request(
      HttpMethod.get,
      '/api/v1/feed/',
    );

    return response.fold(
      (error) {
        throw Exception('Error fetching feeds: $error');
      },
      (data) {
        final List<dynamic> feedData = data['data'];
        if (feedData == null) {
          throw Exception('Feeds data is missing');
        }
        return feedData.map((feed) => FeedPost.fromJson(feed as Map<String, dynamic>)).toList();
      },
    );
  } catch (e) {
    throw Exception('Unexpected error fetching feeds: $e');
  }
});
