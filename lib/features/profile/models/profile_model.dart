// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'profile_pic_url') String? profilePhotoUrl,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'dob') String? dob,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'location_name') String? location,
    @JsonKey(name: 'education_level') String? educationLevel,
    @JsonKey(name: 'field_of_study') String? fieldOfStudy,
    @JsonKey(name: 'college_name') String? collegeName,
    List<String>? skills,
    List<String>? interests,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}
