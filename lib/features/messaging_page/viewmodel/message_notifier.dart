import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../models/message.dart';
import '../websocket_provider.dart';

part 'message_notifier.g.dart';

@riverpod
class MessageNotifier extends _$MessageNotifier {
  Future<List<Message>> fetchMessages(int communityId) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/communities/$communityId/messages',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching messages: $error');
        },
        (data) {
          final messagesData = data['data'];

          if (messagesData == null || messagesData is! List) {
            return [];
          }

          final messages = messagesData
              .map((item) {
                try {
                  return Message.fromJson(item);
                } catch (e) {
                  return null;
                }
              })
              .where((message) => message != null)
              .toList();

          return messages.cast<Message>();
        },
      );
    } catch (e) {
      throw Exception('Unexpected error fetching messages: $e');
    }
  }

  void sendMessage({
    required String messageText,
    required String userId,
    required String communityId,
  }) {
    final websocketChannel = ref.watch(websocketProvider({
      'communityId': communityId,
      'userId': userId,
    }));

    websocketChannel.sink.add(messageText);
  }

  @override
  FutureOr<List<Message>> build(int communityId) async {
    state = const AsyncLoading();

    try {
      final messages = await fetchMessages(communityId);
      state = AsyncValue.data(messages);
      return messages;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching messages: $e', stackTrace);
      return [];
    }
  }
}
