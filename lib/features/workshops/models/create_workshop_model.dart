import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_workshop_model.freezed.dart';
part 'create_workshop_model.g.dart';

@freezed
class CreateWorkshopModel with _$CreateWorkshopModel {
  factory CreateWorkshopModel({
    required String title,
    String? description,
    required String? date,
    String? location,
    @JsonKey(name: 'entry_fee') String? entryFee,
    String? duration,
    @JsonKey(name: 'instructor_info') String? instructorInfo,
    String? tags,
    @JsonKey(name: 'participant_limit') int? participantLimit,
    required String status,
    @JsonKey(name: 'registration_link') String? registrationLink,
  }) = _CreateWorkshopModel;

  factory CreateWorkshopModel.fromJson(Map<String, dynamic> json) => _$CreateWorkshopModelFromJson(json);
}
