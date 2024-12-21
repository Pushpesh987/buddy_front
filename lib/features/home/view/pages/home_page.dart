import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';
import 'tabs/quiz_section.dart';
import '../../view/widgets/feed_post_card.dart';
import '../../view/pages/create_post.dart';
import '../../viewmodel/home_vm/feed_page_notifier.dart'; // Import the file here

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageState = ref.watch(feedPageProvider); // Watch the provider here

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Buddy'),
          actions: [
            // Add the reload button in the app bar
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // Trigger the reload of the provider
                ref.refresh(feedPageProvider);
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AppPalette.disableButtonGreyColor,
              height: 1.0,
            ),
          ),
        ),
        body: Column(
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
              error: (error, stackTrace) => Center(
                child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
              ),
            ),
          ],
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
