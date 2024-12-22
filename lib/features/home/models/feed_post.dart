import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_post.freezed.dart';
part 'feed_post.g.dart';

@freezed
class FeedPost with _$FeedPost {
  factory FeedPost({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'profile_pic_url') required String profilePicUrl,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'media_url') required String mediaUrl,
    @JsonKey(name: 'likes_count') required int likesCount,
    @JsonKey(name: 'comments_count') required int commentsCount,
    @JsonKey(name: 'tags') required List<String> tags,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _FeedPost;

  factory FeedPost.fromJson(Map<String, dynamic> json) => _$FeedPostFromJson(json);
}
