// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../messaging_page/views/pages/messaging_page.dart';
import '../../viewmodel/joined_comunities_notifier.dart';

class JoinedCommunitiesPage extends ConsumerWidget {
  const JoinedCommunitiesPage({super.key});

  Future<void> _refreshJoinedCommunities(BuildContext context, WidgetRef ref) async {
    await ref.refresh(joinedComunitiesNotifierProvider.future);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final joinedCommunitiesState = ref.watch(joinedComunitiesNotifierProvider);

    return Scaffold(
      body: joinedCommunitiesState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (joinedCommunities) {
          if (joinedCommunities.isEmpty) {
            return Center(
              child: Text(
                'No joined communities',
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => _refreshJoinedCommunities(context, ref),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: joinedCommunities.length,
              itemBuilder: (context, index) {
                final community = joinedCommunities[index];
                final createdAt = DateFormat('yyyy-MM-dd').format(community.createdAt);
                final communityNameParts = community.name.split(' ');
                final initials = communityNameParts.length > 1
                    ? '${communityNameParts[0][0]}${communityNameParts[1][0]}'
                    : communityNameParts[0].substring(0, 2).toUpperCase();

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 8,
                  shadowColor: Colors.grey.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                      child: Text(
                        initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      community.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          community.description ?? 'No description available',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Joined on: $createdAt',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessagingPage(
                            communityName: community.name,
                            communityId: community.id.toString(), // Ensure it is a String
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
        error: (error, _) => Center(
          child: Text(
            'Error: $error',
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
