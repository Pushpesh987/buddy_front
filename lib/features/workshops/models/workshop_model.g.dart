// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkshopModelImpl _$$WorkshopModelImplFromJson(Map<String, dynamic> json) => _$WorkshopModelImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      media: json['media'] as String?,
      entryFee: _stringFromDynamic(json['entry_fee']),
      duration: json['duration'] as String?,
      instructorInfo: json['instructor_info'] as String?,
      tags: json['tags'] as String?,
      participantLimit: _stringFromDynamic(json['participant_limit']),
      status: json['status'] as String?,
      registrationLink: json['registration_link'] as String?,
    );

Map<String, dynamic> _$$WorkshopModelImplToJson(_$WorkshopModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'location': instance.location,
      'media': instance.media,
      'entry_fee': instance.entryFee,
      'duration': instance.duration,
      'instructor_info': instance.instructorInfo,
      'tags': instance.tags,
      'participant_limit': instance.participantLimit,
      'status': instance.status,
      'registration_link': instance.registrationLink,
    };
