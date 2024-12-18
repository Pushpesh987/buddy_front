import 'package:freezed_annotation/freezed_annotation.dart';

part 'hackathon_models.freezed.dart';
part 'hackathon_models.g.dart';

@freezed
class HackathonModels with _$HackathonModels {
  factory HackathonModels({
    String? id, 
    @JsonKey(name: 'user_id') String? userId,
    String? title,
    String? theme,
    String? description,
    String? date,
    String? location,
    @JsonKey(name: 'entry_fee') double? entryFee,
    @JsonKey(name: 'prize_pool') double? prizePool,
    String? media,
    @JsonKey(name: 'registration_deadline') String? registrationDeadline,
    @JsonKey(name: 'organizer_name') String? organizerName,
    @JsonKey(name: 'organizer_contact') String? organizerContact,
    String? tags,
    @JsonKey(name: 'attendee_count') int? attendeeCount,
    String? status,
  }) = _HackathonModels;

  factory HackathonModels.fromJson(Map<String, dynamic> json) => _$HackathonModelsFromJson(json);
}
