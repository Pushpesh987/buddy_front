// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditProfileModelImpl _$$EditProfileModelImplFromJson(Map<String, dynamic> json) => _$EditProfileModelImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      username: json['username'] as String?,
      profilePhotoUrl: json['profile_photo_url'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      location: json['location_name'] as String?,
      educationLevel: json['education_level'] as String?,
      fieldOfStudy: json['field_of_study'] as String?,
      collegeName: json['college_name'] as String?,
      skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      interests: (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$EditProfileModelImplToJson(_$EditProfileModelImpl instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
      'profile_photo_url': instance.profilePhotoUrl,
      'age': instance.age,
      'dob': instance.dob,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'location_name': instance.location,
      'education_level': instance.educationLevel,
      'field_of_study': instance.fieldOfStudy,
      'college_name': instance.collegeName,
      'skills': instance.skills,
      'interests': instance.interests,
    };
