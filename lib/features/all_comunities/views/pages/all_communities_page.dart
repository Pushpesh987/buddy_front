import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/all_comunities_joined_notifier.dart';
import '../../viewmodels/all_comunities_notifier.dart';
import 'package:intl/intl.dart';

class AllCommunitiesPage extends ConsumerWidget {
  const AllCommunitiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final communitiesState = ref.watch(allComunitiesNotifierProvider);

    return Scaffold(
      body: communitiesState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (communities) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            itemCount: communities.length,
            itemBuilder: (context, index) {
              final community = communities[index];
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
                child: GestureDetector(
                  onTap: () async {
                    final communityId = community.id;
                    final result =
                        await ref.read(allComunitiesJoinedNotifierProvider.notifier).joinCommunity(communityId);

                    result.fold(
                      (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error)),
                        );
                      },
                      (_) {
                        // Switch to the Joined Communities tab
                        DefaultTabController.of(context).animateTo(1);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Successfully joined the community!')),
                        );
                      },
                    );
                  },
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
                          'Created on: $createdAt',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(
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
