import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_model.freezed.dart';
part 'edit_profile_model.g.dart';

@freezed
class EditProfileModel with _$EditProfileModel {
  factory EditProfileModel({
    String? firstName,
    String? lastName,
    String? gender,
    String? location,
    String? educationLevel,
    String? fieldOfStudy,
    String? collegeName,
    List<String>? skills,
    List<String>? interests,
  }) = _EditProfileModel;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => _$EditProfileModelFromJson(json);
}
