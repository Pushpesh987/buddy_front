// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workshop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWorkshopModelImpl _$$CreateWorkshopModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateWorkshopModelImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      entryFee: json['entry_fee'] as String?,
      duration: json['duration'] as String?,
      instructorInfo: json['instructor_info'] as String?,
      tags: json['tags'] as String?,
      participantLimit: (json['participant_limit'] as num?)?.toInt(),
      status: json['status'] as String,
      registrationLink: json['registration_link'] as String?,
    );

Map<String, dynamic> _$$CreateWorkshopModelImplToJson(
        _$CreateWorkshopModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'location': instance.location,
      'entry_fee': instance.entryFee,
      'duration': instance.duration,
      'instructor_info': instance.instructorInfo,
      'tags': instance.tags,
      'participant_limit': instance.participantLimit,
      'status': instance.status,
      'registration_link': instance.registrationLink,
    };
