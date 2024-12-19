// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) => _$UserModelImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePhotoUrl: json['profile_pic_url'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_pic_url': instance.profilePhotoUrl,
    };
