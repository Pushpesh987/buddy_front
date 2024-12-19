import 'package:buddy_front/features/home/view/pages/create_post.dart';
import 'package:buddy_front/features/home/view/widgets/feed_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../viewmodel/home_vm/feed_page_notifier.dart';
import 'tabs/quiz_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(feedPageProvider);

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
        body: homePageState.when(
          data: (homePageData) {
            return Column(
              children: [
                const QuizSection(),
                Divider(
                  thickness: 1.3,
                  height: 8,
                  color: AppPalette.blackColor,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: homePageData.length,
                    itemBuilder: (context, index) {
                      final post = homePageData[index];
                      return FeedPostCard(post: post);
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreatePostPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
