import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/shared/shared.dart';
import '../../viewmodel/message_notifier.dart';

class MessagingPage extends ConsumerWidget {
  final String communityName;
  final String communityId;

  const MessagingPage({
    super.key,
    required this.communityName,
    required this.communityId,
  });

  Future<String?> _getCurrentUserId() async {
    final secureStorage = FlutterSecureStorage();
    final shared = Shared(secureStorage: secureStorage);
    final authToken = await shared.getAuthToken();
    if (authToken != null) {
      return shared.decryptToken(authToken);
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = TextEditingController();
    final messageState = ref.watch(messageNotifierProvider(int.parse(communityId)));

    return FutureBuilder<String?>(
      future: _getCurrentUserId(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final currentUserId = snapshot.data;

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
                child: messageState.when(
                  data: (messages) => messages.isEmpty
                      ? const Center(child: Text('No messages yet.'))
                      : ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            final isCurrentUser = message.userId == currentUserId;
                            return Align(
                              alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                color: isCurrentUser ? Colors.teal.shade100 : Colors.grey.shade200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        isCurrentUser ? 'You' : message.username,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        message.message,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        DateFormat('dd MMM yyyy, hh:mm a').format(message.createdAt),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => Center(child: Text('Error: $error')),
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
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        _sendMessage(
                          ref,
                          communityId,
                          messageController.text.trim(),
                          messageController,
                          currentUserId,
                        );
                      },
                      color: Colors.teal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage(
    WidgetRef ref,
    String communityId,
    String messageText,
    TextEditingController controller,
    String? currentUserId,
  ) {
    if (messageText.isNotEmpty && currentUserId != null) {
      ref.read(messageNotifierProvider(int.parse(communityId)).notifier).sendMessage(
            messageText: messageText,
            userId: currentUserId,
            communityId: communityId,
          );
      controller.clear();
    } else {
      print("Failed to send message. Message text or currentUserId is null.");
    }
  }
}
