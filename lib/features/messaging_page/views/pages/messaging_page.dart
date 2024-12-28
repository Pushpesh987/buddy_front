import 'package:flutter/material.dart';

class MessagingPage extends StatelessWidget {
  final String communityName;
  final String communityId;

  const MessagingPage({super.key, required this.communityName, required this.communityId});

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    final List<Map<String, String>> messages = [
      {'user': 'Pushpesh', 'message': 'Hey, how is everyone doing?'},
      {'user': 'Suhan', 'message': 'I’m doing great, thanks for asking!'},
      {'user': 'You', 'message': 'I’m doing well, just catching up with work.'},
      {'user': 'Ranjeet', 'message': 'All good on my side, what about you all?'},
    ];

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
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isCurrentUser = message['user'] == 'You';
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
                        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message['user']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message['message']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(messageController.text.trim(), messageController);
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

  void _sendMessage(String messageText, TextEditingController controller) {
    if (messageText.isNotEmpty) {
      controller.clear();
    }
  }
}
