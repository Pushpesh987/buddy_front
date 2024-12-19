import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_comunities_model.freezed.dart';
part 'all_comunities_model.g.dart';

@freezed
class AllComunitiesModel with _$AllComunitiesModel {
  const factory AllComunitiesModel({
    required int id,
    required String name,
    String? description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _AllComunitiesModel;

  factory AllComunitiesModel.fromJson(Map<String, dynamic> json) => _$AllComunitiesModelFromJson(json);
}
