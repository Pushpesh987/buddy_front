import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/like_model.dart';
import '../../viewmodel/test_notifier/like_notifier.dart';

class LikeButton extends ConsumerWidget {
  final String postId;
  final String userId;

  const LikeButton({super.key, required this.postId, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(likeNotifierProvider);

    return IconButton(
      icon: Icon(
        Icons.thumb_up,
        color: isLiked ? Colors.red : Colors.grey,
      ),
      onPressed: () async {
        final like = Like(userId: userId, postId: postId);

        try {
          if (isLiked) {
            await ref.read(likeNotifierProvider.notifier).sendUnlike(like);
          } else {
            await ref.read(likeNotifierProvider.notifier).sendLike(like);
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      },
    );
  }
}
