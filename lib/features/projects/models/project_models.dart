import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_models.freezed.dart';
part 'project_models.g.dart';

@freezed
class ProjectModels with _$ProjectModels {
  factory ProjectModels({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
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
  }) = _ProjectModels;

  factory ProjectModels.fromJson(Map<String, dynamic> json) => _$ProjectModelsFromJson(json);
}
