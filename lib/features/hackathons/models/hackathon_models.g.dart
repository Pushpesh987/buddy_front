// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hackathon_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HackathonModelsImpl _$$HackathonModelsImplFromJson(Map<String, dynamic> json) => _$HackathonModelsImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      title: json['title'] as String?,
      theme: json['theme'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      location: json['location'] as String?,
      entryFee: (json['entry_fee'] as num?)?.toInt(),
      prizePool: (json['prize_pool'] as num?)?.toInt(),
      media: json['media'] as String?,
      registrationDeadline: json['registration_deadline'] as String?,
      organizerName: json['organizer_name'] as String?,
      organizerContact: json['organizer_contact'] as String?,
      tags: json['tags'] as String?,
      attendeeCount: (json['attendee_count'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$HackathonModelsImplToJson(_$HackathonModelsImpl instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'theme': instance.theme,
      'description': instance.description,
      'date': instance.date,
      'location': instance.location,
      'entry_fee': instance.entryFee,
      'prize_pool': instance.prizePool,
      'media': instance.media,
      'registration_deadline': instance.registrationDeadline,
      'organizer_name': instance.organizerName,
      'organizer_contact': instance.organizerContact,
      'tags': instance.tags,
      'attendee_count': instance.attendeeCount,
      'status': instance.status,
    };
