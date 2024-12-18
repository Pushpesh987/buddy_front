import 'package:flutter/material.dart';

class HomePageFeedSection extends StatelessWidget {
  const HomePageFeedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //   flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'This is some dummy text. Here you can add more content or instructions.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
