// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelsImpl _$$ProjectModelsImplFromJson(Map<String, dynamic> json) => _$ProjectModelsImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      location: json['location'] as String?,
      media: json['media'] as String?,
      tags: json['tags'] as String?,
      teamMembers: json['teamMembers'] as String?,
      status: json['status'] as String?,
      sponsors: json['sponsors'] as String?,
      projectLink: json['project_link'] as String?,
      goals: json['goals'] as String?,
      domain: json['domain'] as String?,
    );

Map<String, dynamic> _$$ProjectModelsImplToJson(_$ProjectModelsImpl instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'location': instance.location,
      'media': instance.media,
      'tags': instance.tags,
      'teamMembers': instance.teamMembers,
      'status': instance.status,
      'sponsors': instance.sponsors,
      'project_link': instance.projectLink,
      'goals': instance.goals,
      'domain': instance.domain,
    };
