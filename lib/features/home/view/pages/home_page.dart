// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../viewmodel/test_notifier/feed_post_notifier.dart';
import 'tabs/quiz_section.dart';
import '../../view/widgets/feed_post_card.dart';
import '../../view/pages/create_post.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _refreshFeed(WidgetRef ref) async {
    ref.refresh(feedPostNotifierProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(feedPostNotifierProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buddy'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Divider(
              color: AppPalette.disableButtonGreyColor,
              thickness: 1.0,
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => _refreshFeed(ref),
          child: Column(
            children: [
              const QuizSection(),
              homePageState.when(
                data: (homePageData) {
                  if (homePageData.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'No posts available',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: homePageData.length,
                        itemBuilder: (context, index) {
                          final post = homePageData[index];
                          return FeedPostCard(post: post);
                        },
                      ),
                    );
                  }
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                },
              ),
            ],
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
