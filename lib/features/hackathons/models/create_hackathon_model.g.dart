// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_hackathon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateHackathonModelImpl _$$CreateHackathonModelImplFromJson(Map<String, dynamic> json) =>
    _$CreateHackathonModelImpl(
      title: json['title'] as String?,
      theme: json['theme'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      entryFee: json['entry_fee'] as String?,
      prizePool: json['prize_pool'] as String?,
      registrationDeadline: json['registration_deadline'] as String?,
      organizerName: json['organizer_name'] as String?,
      organizerContact: json['organizer_contact'] as String?,
      tags: json['tags'] as String?,
      attendeeCount: json['attendee_count'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$CreateHackathonModelImplToJson(_$CreateHackathonModelImpl instance) => <String, dynamic>{
      'title': instance.title,
      'theme': instance.theme,
      'description': instance.description,
      'date': instance.date,
      'location': instance.location,
      'entry_fee': instance.entryFee,
      'prize_pool': instance.prizePool,
      'registration_deadline': instance.registrationDeadline,
      'organizer_name': instance.organizerName,
      'organizer_contact': instance.organizerContact,
      'tags': instance.tags,
      'attendee_count': instance.attendeeCount,
      'status': instance.status,
    };
