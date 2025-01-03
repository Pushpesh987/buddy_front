// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: (json['id'] as num?)?.toInt(),
      communityId: (json['community_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      username: json['username'] as String?,
      message: json['message'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'community_id': instance.communityId,
      'user_id': instance.userId,
      'username': instance.username,
      'message': instance.message,
      'created_at': instance.createdAt?.toIso8601String(),
    };
