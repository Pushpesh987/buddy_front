import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../models/message.dart';
import '../websocket_provider.dart';

part 'message_notifier.g.dart';

@riverpod
class MessageNotifier extends _$MessageNotifier {
  late final WebSocketChannel _webSocketChannel;

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

      // Initialize WebSocket and listen for incoming messages
      await initWebSocket(communityId);

      return messages;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching messages: $e', stackTrace);
      return [];
    }
  }

  // Initialize WebSocket connection
  Future<void> initWebSocket(int communityId) async {
    // Ensure WebSocket is initialized
    final websocketChannel = ref.watch(websocketProvider({
      'communityId': '$communityId',
      'userId': 'userId', // Replace with actual user ID
    }));

    // Listen to WebSocket stream
    websocketChannel.stream.listen(
      (messageText) {
        print('Received message from WebSocket: $messageText');
        
        // Parse the message and update the state if needed
        try {
          final messageJson = jsonDecode(messageText);

          final username = messageJson['username'];
          final message = messageJson['message'];
          final createdAt = DateTime.parse(messageJson['createdAt']);
          final userId = messageJson['userId'];

          final newMessage = Message(
            username: username,
            message: message,
            createdAt: createdAt,
            userId: userId,
          );

          // Add the new message to the list and update the state
          final updatedMessages = List<Message>.from(state.value ?? [])..insert(0, newMessage);
          state = AsyncValue.data(updatedMessages); // Update state with new message
        } catch (e) {
          print('Error parsing WebSocket message: $e');
        }
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket connection closed');
      },
    );
  }
}
