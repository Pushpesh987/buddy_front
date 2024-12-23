import 'package:freezed_annotation/freezed_annotation.dart';

part 'joined_comunities_model.freezed.dart';
part 'joined_comunities_model.g.dart';

@freezed
class JoinedComunitiesModel with _$JoinedComunitiesModel {
  const factory JoinedComunitiesModel({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _JoinedComunitiesModel;

  factory JoinedComunitiesModel.fromJson(Map<String, dynamic> json) => _$JoinedComunitiesModelFromJson(json);
}
