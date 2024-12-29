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
  final channel = WebSocketChannel.connect(Uri.parse(socketUrl));

  ref.onDispose(() {
    channel.sink.close();
  });

  return channel;
});
