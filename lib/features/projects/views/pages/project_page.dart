import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/project_notifier.dart';
import '../widgets/project_cards.dart';
import 'create_project_event.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

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
              return ProjectCards(
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
