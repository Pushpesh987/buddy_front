import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    required String message,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required String category,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);
}
