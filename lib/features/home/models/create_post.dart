import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_post.freezed.dart';
part 'create_post.g.dart';

@freezed
class CreatePost with _$CreatePost {
  factory CreatePost({
    @JsonKey(name: 'content') required String content,
  }) = _CreatePost;

  factory CreatePost.fromJson(Map<String, dynamic> json) => _$CreatePostFromJson(json);
}
