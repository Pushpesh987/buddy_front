import 'package:freezed_annotation/freezed_annotation.dart';

part 'workshop_model.freezed.dart';
part 'workshop_model.g.dart';

@freezed
class WorkshopModel with _$WorkshopModel {
  factory WorkshopModel({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? date,
    String? location,
    String? media,
    @JsonKey(name: 'entry_fee') String? entryFee,
    @JsonKey(name: 'Duration') String? duration,
    @JsonKey(name: 'instructor_info') String? instructorInfo,
    String? tags,
    @JsonKey(name: 'participant_limit') int? participantLimit,
    String? status,
    @JsonKey(name: 'registration_link') String? registrationLink,
  }) = _WorkshopModel;

  factory WorkshopModel.fromJson(Map<String, dynamic> json) => _$WorkshopModelFromJson(json);
}
