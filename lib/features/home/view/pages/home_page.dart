import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_pallete.dart';
import 'tabs/home_page_feed_section.dart';
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
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: AppPalette.blackColor,
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            QuizSection(),
            Divider(
              thickness: 1.3,
              height: 8,
              color: AppPalette.blackColor,
            ),
            HomePageFeedSection(),
          ],
        ),
      ),
    );
  }
}
