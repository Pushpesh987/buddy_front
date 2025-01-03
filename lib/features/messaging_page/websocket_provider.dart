import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final websocketProvider = Provider.family<WebSocketChannel, Map<String, String>>((ref, params) {
  final communityId = params['communityId'];
  final userId = params['userId'];

  if (communityId == null || userId == null) {
    throw Exception("Community ID and User ID must be provided.");
  }

  final String socketUrl =
      'wss://backend-7xif.onrender.com/api/v1/communities/$communityId/messages/ws/conn?user_id=$userId';

  // Establish WebSocket connection
  final channel = WebSocketChannel.connect(Uri.parse(socketUrl));

  // Logging for debugging purposes
  channel.stream.listen(
    (message) {
      print('Received message from WebSocket: $message');
    },
    onDone: () {
      print('WebSocket connection closed');
    },
    onError: (error) {
      print('WebSocket error: $error');
    },
  );

  // Ensure the WebSocket stays active until community is closed or user navigates away
  ref.onDispose(() {
    print('Closing WebSocket channel');
    channel.sink.close();
  });

  return channel;
});
