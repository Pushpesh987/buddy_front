import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_hackathon_model.freezed.dart';
part 'create_hackathon_model.g.dart';

@freezed
class CreateHackathonModel with _$CreateHackathonModel {
  factory CreateHackathonModel({
    String? title,
    String? theme,
    String? description,
    String? date,
    String? location,
    @JsonKey(name: 'entry_fee') int? entryFee,
    @JsonKey(name: 'prize_pool') int? prizePool,
    String? media,
    @JsonKey(name: 'registration_deadline') String? registrationDeadline,
    @JsonKey(name: 'organizer_name') String? organizerName,
    @JsonKey(name: 'organizer_contact') String? organizerContact,
    String? tags,
    @JsonKey(name: 'attendee_count') int? attendeeCount,
    String? status,
  }) = _CreateHackathonModel;

  factory CreateHackathonModel.fromJson(Map<String, dynamic> json) => _$CreateHackathonModelFromJson(json);
}
