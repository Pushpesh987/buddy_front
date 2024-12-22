import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/project_notifier.dart';
import '../widgets/project_cards.dart';
import 'create_project_event.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

  Future<void> _refreshProjects(WidgetRef ref) async {
    final notifier = ref.read(projectNotifierProvider.notifier);
    await notifier.fetchProjects();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectNotifierProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refreshProjects(ref),
        child: projectState.when(
          data: (projects) {
            if (projects.isEmpty) {
              return const Center(child: Text('No projects available.'));
            }

            projects.sort((a, b) {
              final dateA = a.startDate != null ? DateTime.tryParse(a.startDate!) : null;
              final dateB = b.startDate != null ? DateTime.tryParse(b.startDate!) : null;

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
