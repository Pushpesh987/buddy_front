import 'package:flutter/material.dart';
import '../../../joined_communities/views/pages/joined_communities_page.dart';
import '../../../all_comunities/views/pages/all_communities_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: "All Communities"),
              Tab(icon: Icon(Icons.group), text: "Joined Communities"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllCommunitiesPage(),
            JoinedCommunitiesPage(),
          ],
        ),
      ),
    );
  }
}
