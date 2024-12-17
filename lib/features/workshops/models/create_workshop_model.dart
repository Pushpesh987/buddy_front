import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_workshop_model.freezed.dart';
part 'create_workshop_model.g.dart';

@freezed
class CreateWorkshopModel with _$CreateWorkshopModel {
  factory CreateWorkshopModel({
    String? title,
    String? description,
    String? date,
    String? location,
    String? media,
    @JsonKey(name: 'entry_fee', fromJson: _stringFromDynamic) String? entryFee, // Handles mixed types
    @JsonKey(name: 'Duration') String? duration,
    @JsonKey(name: 'instructor_info') String? instructorInfo,
    String? tags,
    @JsonKey(name: 'participant_limit', fromJson: _stringFromDynamic) String? participantLimit, // Handles mixed types
    String? status,
    @JsonKey(name: 'registration_link') String? registrationLink,
  }) = _CreateWorkshopModel;

  factory CreateWorkshopModel.fromJson(Map<String, dynamic> json) => _$CreateWorkshopModelFromJson(json);
}

// Helper function to handle dynamic types and convert to int
String? _stringFromDynamic(dynamic value) {
  if (value == null) {
    return null;
  }
  return value.toString();
}
