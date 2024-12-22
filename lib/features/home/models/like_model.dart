import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_model.freezed.dart';
part 'like_model.g.dart';

@freezed
class Like with _$Like {
  const factory Like({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'post_id') required String postId,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
