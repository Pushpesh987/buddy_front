import 'package:flutter/material.dart';

class PostMedia extends StatelessWidget {
  final String mediaUrl;

  const PostMedia({super.key, required this.mediaUrl});

  @override
  Widget build(BuildContext context) {
    return mediaUrl.isNotEmpty
        ? Image.network(
            mediaUrl,
            fit: BoxFit.cover,
          )
        : const SizedBox.shrink();
  }
}
