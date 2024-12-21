import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/notification_model.dart';

part 'notification_notifier.g.dart';

@riverpod
class NotificationNotifier extends AutoDisposeAsyncNotifier<List<NotificationResponse>> {
  Future<List<NotificationResponse>> fetchNotifications() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/notification/',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching notifications: $error');
        },
        (data) {
          final notificationsData = data['data'];

          if (notificationsData == null || notificationsData is! List) {
            throw Exception('Notifications data is missing or invalid');
          }

          // Convert each notification to NotificationResponse
          return notificationsData.map<NotificationResponse>((json) {
            return NotificationResponse.fromJson(json);
          }).toList();
        },
      );
    } catch (e) {
      throw Exception('Unexpected error fetching notifications: $e');
    }
  }

  @override
  FutureOr<List<NotificationResponse>> build() async {
    state = const AsyncValue.loading();

    try {
      final notifications = await fetchNotifications();
      state = AsyncValue.data(notifications);
      return notifications;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching notifications: $e', stackTrace);
      rethrow;
    }
  }
}
