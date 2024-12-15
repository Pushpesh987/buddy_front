import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_project_model.freezed.dart';
part 'create_project_model.g.dart';

@freezed
class CreateProjectModel with _$CreateProjectModel {
  factory CreateProjectModel({
    String? title,
    String? description,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    String? location,
    String? media,
    String? tags,
    String? teamMembers,
    String? status,
    String? sponsors,
    @JsonKey(name: 'project_link') String? projectLink,
    String? goals,
    @JsonKey(name: 'domain') String? domain,
  }) = _CreateProjectModel;

  factory CreateProjectModel.fromJson(Map<String, dynamic> json) => _$CreateProjectModelFromJson(json);
}
