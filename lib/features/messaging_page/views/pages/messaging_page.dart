import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/message_notifier.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class MessagingPage extends ConsumerWidget {
  final String communityName;
  final String communityId;

  const MessagingPage({super.key, required this.communityName, required this.communityId});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageState = ref.watch(messageProvider(communityId));
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.teal,
              child: Text(
                communityName.isNotEmpty ? communityName[0].toUpperCase() : 'N',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(communityName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<String?>(
              future: _getUserId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                final currentUserId = snapshot.data;

                return messageState.when(
                  data: (messages) {
                    return ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        final isCurrentUser = message.sender == currentUserId;
                        return Align(
                          alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                message.message,
                                style: const TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, _) => Center(child: Text('Error: $error')),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    ),
                    onSubmitted: (messageText) {
                      _sendMessage(messageText, ref, messageController);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(messageController.text.trim(), ref, messageController);
                  },
                  color: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String messageText, WidgetRef ref, TextEditingController controller) {
    if (messageText.isNotEmpty) {
      ref.read(messageNotifierProvider.notifier).sendMessage(messageText);
      controller.clear();
    }
  }
}
