import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import '../../models/feed_post.dart';
import 'post_media.dart';
import 'post_stats.dart';

class FeedPostCard extends StatelessWidget {
  final FeedPost post;

  const FeedPostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppPalette.yellowColorAmberAccent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   Row(
              //     children: [
              //       CircleAvatar(
              //         // backgroundImage: NetworkImage(post.userProfileUrl),
              //         backgroundImage: NetworkImage(
              //             'https://wallpapers.com/images/featured/cool-profile-picture-87h46gcobjl5e4xu.webp'),
              //         radius: 20.0,
              //       ),
              //       const SizedBox(width: 8.0),
              //       Text(
              //         "ppk profile",
              //         // post.userName,
              //         style: const TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              //   const SizedBox(height: 8.0),
              //   const Divider(
              //     thickness: 1.0,
              //     color: Colors.grey,
              //   ),
              //   const SizedBox(height: 8.0),
              Text(
                post.content,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Center(
                child: PostMedia(mediaUrl: post.mediaUrl),
              ),
              const SizedBox(height: 10.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: post.tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    backgroundColor: Colors.blue.shade100,
                    labelStyle: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
              const Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
              PostStats(post: post),
            ],
          ),
        ),
      ),
    );
  }
}
