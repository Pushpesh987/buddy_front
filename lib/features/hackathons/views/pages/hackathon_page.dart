import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:buddy_front/features/hackathons/views/widgets/hackathon_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/hackathon_notifier.dart';
import 'create_hackathon_event.dart';

class HackathonPage extends ConsumerWidget {
  const HackathonPage({super.key});

  Future<void> _refreshHackathons(WidgetRef ref) async {
    final notifier = ref.read(projectNotifierProvider.notifier);
    await notifier.fetchProjects();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectNotifierProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshHackathons(ref),
        child: projectState.when(
          data: (projects) {
            if (projects.isEmpty) {
              return const Center(child: Text('No hackathons available.'));
            }

            projects.sort((a, b) {
              final dateA = a.date != null ? DateTime.tryParse(a.date!) : null;
              final dateB = b.date != null ? DateTime.tryParse(b.date!) : null;

              if (dateA == null && dateB == null) return 0;
              if (dateA == null) return 1;
              if (dateB == null) return -1;

              return dateA.compareTo(dateB);
            });

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return HackathonCards(
                  text: project.title,
                  imagePath: project.media,
                  description: project.description,
                  tags: project.tags,
                  id: project.id,
                );
              },
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateHackathonEvent()),
          );
        },
        backgroundColor: AppPalette.yellowColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
