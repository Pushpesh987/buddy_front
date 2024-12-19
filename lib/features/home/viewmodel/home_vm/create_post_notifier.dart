import 'dart:io';
import 'package:buddy_front/core/api_service/file_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/service_provider.dart/file_service_provider.dart';
import '../../models/create_post.dart';

part 'create_post_notifier.g.dart';

@riverpod
class PostCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createPost(CreatePost newPost, {File? imageFile}) async {
    final fileUploadService = ref.watch(fileUploadServiceProvider);

    try {
      final requestBody = newPost.toJson();
      final response = await fileUploadService.uploadDataWithFile(
        HttpMethodFile.post,
        '/api/v1/posts/post',
        data: requestBody,
        file: imageFile,
        keyName: 'media',
      );
      response.fold(
        (error) {
          throw Exception('Error creating post: $error');
        },
        (data) {
          print("successfull sendned");
        },
      );
    } catch (e) {
      throw Exception('Error creating post: $e');
    }
  }
}
