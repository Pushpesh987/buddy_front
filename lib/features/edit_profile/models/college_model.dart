import 'package:freezed_annotation/freezed_annotation.dart';

part 'college_model.freezed.dart';
part 'college_model.g.dart';

@freezed
class CollegeModel with _$CollegeModel {
  factory CollegeModel({
    @JsonKey(name: 'college_name') String? collegeName,
  }) = _CollegeModel;

  factory CollegeModel.fromJson(Map<String, dynamic> json) => _$CollegeModelFromJson(json);
}
