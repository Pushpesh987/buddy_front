// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joined_comunities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinedComunitiesModelImpl _$$JoinedComunitiesModelImplFromJson(Map<String, dynamic> json) =>
    _$JoinedComunitiesModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$JoinedComunitiesModelImplToJson(_$JoinedComunitiesModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
    };
