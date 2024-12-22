import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/workshop_notifier.dart';
import '../widgets/workshop_cards.dart';
import 'create_workshop_event.dart';

class WorkshopPage extends ConsumerWidget {
  const WorkshopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workshopState = ref.watch(workshopNotifierProvider);
    return Scaffold(
      body: workshopState.when(
        data: (workshops) {
          if (workshops.isEmpty) {
            return const Center(child: Text('No workshops available.'));
          }

          workshops.sort((a, b) {
            final dateA = a.date != null ? DateTime.tryParse(a.date!) : null;
            final dateB = b.date != null ? DateTime.tryParse(b.date!) : null;

            if (dateA == null && dateB == null) return 0;
            if (dateA == null) return 1;
            if (dateB == null) return -1;

            return dateA.compareTo(dateB);
          });

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: workshops.length,
            itemBuilder: (context, index) {
              final workshop = workshops[index];
              return WorkshopCards(
                text: workshop.title,
                imagePath: workshop.media,
                description: workshop.description,
                tags: workshop.tags,
                id: workshop.id,
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
            MaterialPageRoute(builder: (context) => const CreateWorkshopEvent()),
          );
        },
        backgroundColor: AppPalette.yellowColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
