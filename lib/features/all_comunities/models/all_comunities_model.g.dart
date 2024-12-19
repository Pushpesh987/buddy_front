// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_comunities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllComunitiesModelImpl _$$AllComunitiesModelImplFromJson(Map<String, dynamic> json) => _$AllComunitiesModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AllComunitiesModelImplToJson(_$AllComunitiesModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
    };
