import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    int? id,
    @JsonKey(name: 'community_id') int? communityId,
    @JsonKey(name: 'user_id')String? userId,
    String? username,
    String? message,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
