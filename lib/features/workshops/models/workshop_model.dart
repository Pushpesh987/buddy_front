import 'package:freezed_annotation/freezed_annotation.dart';

part 'workshop_model.freezed.dart';
part 'workshop_model.g.dart';

@freezed
class WorkshopModel with _$WorkshopModel {
  factory WorkshopModel({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    String? title,
    String? description,
    String? date,
    String? location,
    String? media,
    @JsonKey(name: 'entry_fee', fromJson: _stringFromDynamic) String? entryFee,
    @JsonKey(name: 'duration') String? duration,
    @JsonKey(name: 'instructor_info') String? instructorInfo,
    String? tags,
    @JsonKey(name: 'participant_limit', fromJson: _stringFromDynamic) String? participantLimit, // Handles mixed types
    String? status,
    @JsonKey(name: 'registration_link') String? registrationLink,
  }) = _WorkshopModel;

  factory WorkshopModel.fromJson(Map<String, dynamic> json) => _$WorkshopModelFromJson(json);
}

// Helper function to handle dynamic types
String? _stringFromDynamic(dynamic value) {
  if (value == null) {
    return null;
  }
  return value.toString();
}
