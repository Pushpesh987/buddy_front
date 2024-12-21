// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationResponseImpl _$$NotificationResponseImplFromJson(Map<String, dynamic> json) =>
    _$NotificationResponseImpl(
      message: json['message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      category: json['category'] as String,
    );

Map<String, dynamic> _$$NotificationResponseImplToJson(_$NotificationResponseImpl instance) => <String, dynamic>{
      'message': instance.message,
      'created_at': instance.createdAt.toIso8601String(),
      'category': instance.category,
    };
