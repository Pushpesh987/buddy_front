import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:buddy_front/features/hackathons/views/widgets/hackathon_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/hackathon_notifier.dart';
import 'create_hackathon_event.dart';

class HackathonPage extends ConsumerWidget {
  const HackathonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectNotifierProvider);

    return Scaffold(
      body: projectState.when(
        data: (projects) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateProjectEvent()),
          );
        },
        backgroundColor: AppPalette.yellowColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
