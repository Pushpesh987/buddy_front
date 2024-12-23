import 'dart:convert';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../models/message_model.dart';

final messageProvider = FutureProvider.family<List<MessageModel>, String>((ref, communityId) async {
  final userId = await _getUserId();
  final messageNotifier = ref.read(messageNotifierProvider.notifier);
  return messageNotifier.fetchMessages(communityId, userId!);
});

final messageNotifierProvider = StateNotifierProvider<MessageNotifier, List<MessageModel>>((ref) {
  return MessageNotifier();
});

Future<String?> _getUserId() async {
  final secureStorage = FlutterSecureStorage();
  final token = await secureStorage.read(key: 'auth_token');
  if (token != null) {
    try {
      final payload = Jwt.parseJwt(token);
      return payload['user_id'];
    } catch (e) {
      return null;
    }
  }
  return null;
}

class MessageNotifier extends StateNotifier<List<MessageModel>> {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  MessageNotifier() : super([]);

  Future<List<MessageModel>> fetchMessages(String communityId, String userId) async {
    final url = 'wss://backend-7xif.onrender.com/api/v1/communities/$communityId/messages/ws/conn?user_id=$userId';
    _channel = WebSocketChannel.connect(Uri.parse(url));

    _subscription = _channel!.stream.listen((data) {
      final message = MessageModel.fromJson(json.decode(data));
      state = [...state, message];
    }, onError: (error) {});

    return state;
  }

  void sendMessage(String messageText) {
    if (_channel != null && messageText.isNotEmpty) {
      _channel!.sink.add(messageText);
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _channel?.sink.close();
    super.dispose();
  }
}
