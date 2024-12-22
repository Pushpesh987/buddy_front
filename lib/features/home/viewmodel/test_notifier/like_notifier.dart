import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/like_model.dart';

part 'like_notifier.g.dart';

@riverpod
class LikeNotifier extends _$LikeNotifier {
  @override
  bool build() {
    return false;
  }

  Future<void> sendLike(Like like) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.post,
        '/api/v1/posts/like',
        data: like.toJson(),
      );

      response.fold(
        (error) {
          throw Exception('Error sending like: $error');
        },
        (data) {
          state = true;
        },
      );
    } catch (e) {
      throw Exception('Unexpected error sending like: $e');
    }
  }

  Future<void> sendUnlike(Like like) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.delete,
        '/api/v1/posts/like',
        data: like.toJson(),
      );

      response.fold(
        (error) {
          throw Exception('Error sending unlike: $error');
        },
        (data) {
          state = false;
        },
      );
    } catch (e) {
      throw Exception('Unexpected error sending unlike: $e');
    }
  }
}
