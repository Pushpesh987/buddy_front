import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class SkillModel with _$SkillModel {
  factory SkillModel({
    @JsonKey(name: 'skill_name') String? skillName,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);
}
