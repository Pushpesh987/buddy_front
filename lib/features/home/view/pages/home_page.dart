import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';
import 'tabs/quiz_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buddy'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AppPalette.blackColor,
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            const QuizSection(),
            Divider(
              thickness: 1.3,
              height: 8,
              color: AppPalette.blackColor,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is some dummy text. Here you can add more content or instructions.',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Floating Action Button Pressed!')),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
