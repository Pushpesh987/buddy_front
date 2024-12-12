// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileModelImpl _$$EditProfileModelImplFromJson(Map<String, dynamic> json) => _$EditProfileModelImpl(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      location: json['location'] as String?,
      educationLevel: json['educationLevel'] as String?,
      fieldOfStudy: json['fieldOfStudy'] as String?,
      collegeName: json['collegeName'] as String?,
      skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      interests: (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$EditProfileModelImplToJson(_$EditProfileModelImpl instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'location': instance.location,
      'educationLevel': instance.educationLevel,
      'fieldOfStudy': instance.fieldOfStudy,
      'collegeName': instance.collegeName,
      'skills': instance.skills,
      'interests': instance.interests,
    };
