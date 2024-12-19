import 'package:flutter/material.dart';
import '../../models/feed_post.dart';

class PostStats extends StatelessWidget {
  final FeedPost post;

  const PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.thumb_up,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(post.likesCount.toString()),
        const SizedBox(width: 15),
        Icon(
          Icons.comment,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 5),
        Text(post.commentsCount.toString()),
      ],
    );
  }
}
