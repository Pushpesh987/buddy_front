import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_of_study_model.freezed.dart';
part 'field_of_study_model.g.dart';

@freezed
class FieldOfStudyModel with _$FieldOfStudyModel {
  factory FieldOfStudyModel({
    @JsonKey(name: 'level_name') String? levelName,
  }) = _FieldOfStudyModel;

  factory FieldOfStudyModel.fromJson(Map<String, dynamic> json) => _$FieldOfStudyModelFromJson(json);
}
