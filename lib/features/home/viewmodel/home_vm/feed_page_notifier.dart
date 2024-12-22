// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../core/service_provider.dart/service_provider.dart';
// import '../../models/feed_post.dart';
// import '../../../../core/api_service/api_service.dart';

// final feedPageProvider = StateNotifierProvider<FeedPageNotifier, AsyncValue<List<FeedPost>>>((ref) {
//   final apiService = ref.watch(apiServiceProvider); // Assuming you have apiServiceProvider
//   return FeedPageNotifier(apiService);
// });

// class FeedPageNotifier extends StateNotifier<AsyncValue<List<FeedPost>>> {
//   final ApiService apiService;

//   FeedPageNotifier(this.apiService) : super(const AsyncValue.loading()) {
//     fetchFeedPosts();
//   }

//   Future<void> fetchFeedPosts() async {
//     try {
//       final response = await apiService.request(
//         HttpMethod.get,
//         '/api/v1/feed/',
//       );

//       response.fold(
//         (error) {
//           state = AsyncValue.error('Error fetching posts: $error', StackTrace.current); // Pass the stack trace
//         },
//         (data) {
//           final List<dynamic>? feedData = data['data'];
//           if (feedData == null || feedData.isEmpty) {
//             state = const AsyncValue.data([]); // Empty data
//           } else {
//             state = AsyncValue.data(
//               feedData.map((feed) => FeedPost.fromJson(feed as Map<String, dynamic>)).toList(),
//             );
//           }
//         },
//       );
//     } catch (e, stackTrace) {
//       state = AsyncValue.error('Unexpected error fetching posts: $e', stackTrace); // Pass stackTrace here as well
//     }
//   }
// }
