import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_model.freezed.dart';
part 'create_project_model.g.dart';

@freezed
class CreateProjectModel with _$CreateProjectModel {
  factory CreateProjectModel({
    String? title,
    String? description,
    String? domain,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    String? location,
    String? tags,
    @JsonKey(name: 'team_members') String? teamMembers,
    String? status,
    String? sponsors,
    @JsonKey(name: 'project_link') String? projectLink,
    String? goals,
  }) = _CreateProjectModel;

  factory CreateProjectModel.fromJson(Map<String, dynamic> json) => _$CreateProjectModelFromJson(json);
}
