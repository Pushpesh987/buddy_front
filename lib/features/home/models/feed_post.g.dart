// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedPostImpl _$$FeedPostImplFromJson(Map<String, dynamic> json) => _$FeedPostImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      content: json['content'] as String,
      mediaUrl: json['media_url'] as String,
      likesCount: (json['likes_count'] as num).toInt(),
      commentsCount: (json['comments_count'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$FeedPostImplToJson(_$FeedPostImpl instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'content': instance.content,
      'media_url': instance.mediaUrl,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'tags': instance.tags,
      'created_at': instance.createdAt,
    };
