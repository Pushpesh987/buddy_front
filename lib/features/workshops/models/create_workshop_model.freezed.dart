// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_workshop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateWorkshopModel _$CreateWorkshopModelFromJson(Map<String, dynamic> json) {
  return _CreateWorkshopModel.fromJson(json);
}

/// @nodoc
mixin _$CreateWorkshopModel {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_fee')
  String? get entryFee => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'instructor_info')
  String? get instructorInfo => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_limit')
  int? get participantLimit => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_link')
  String? get registrationLink => throw _privateConstructorUsedError;

  /// Serializes this CreateWorkshopModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateWorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateWorkshopModelCopyWith<CreateWorkshopModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWorkshopModelCopyWith<$Res> {
  factory $CreateWorkshopModelCopyWith(CreateWorkshopModel value, $Res Function(CreateWorkshopModel) then) =
      _$CreateWorkshopModelCopyWithImpl<$Res, CreateWorkshopModel>;
  @useResult
  $Res call(
      {String title,
      String? description,
      String? date,
      String? location,
      @JsonKey(name: 'entry_fee') String? entryFee,
      String? duration,
      @JsonKey(name: 'instructor_info') String? instructorInfo,
      String? tags,
      @JsonKey(name: 'participant_limit') int? participantLimit,
      String status,
      @JsonKey(name: 'registration_link') String? registrationLink});
}

/// @nodoc
class _$CreateWorkshopModelCopyWithImpl<$Res, $Val extends CreateWorkshopModel>
    implements $CreateWorkshopModelCopyWith<$Res> {
  _$CreateWorkshopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateWorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? location = freezed,
    Object? entryFee = freezed,
    Object? duration = freezed,
    Object? instructorInfo = freezed,
    Object? tags = freezed,
    Object? participantLimit = freezed,
    Object? status = null,
    Object? registrationLink = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      entryFee: freezed == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorInfo: freezed == instructorInfo
          ? _value.instructorInfo
          : instructorInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      participantLimit: freezed == participantLimit
          ? _value.participantLimit
          : participantLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      registrationLink: freezed == registrationLink
          ? _value.registrationLink
          : registrationLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateWorkshopModelImplCopyWith<$Res> implements $CreateWorkshopModelCopyWith<$Res> {
  factory _$$CreateWorkshopModelImplCopyWith(
          _$CreateWorkshopModelImpl value, $Res Function(_$CreateWorkshopModelImpl) then) =
      __$$CreateWorkshopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      String? date,
      String? location,
      @JsonKey(name: 'entry_fee') String? entryFee,
      String? duration,
      @JsonKey(name: 'instructor_info') String? instructorInfo,
      String? tags,
      @JsonKey(name: 'participant_limit') int? participantLimit,
      String status,
      @JsonKey(name: 'registration_link') String? registrationLink});
}

/// @nodoc
class __$$CreateWorkshopModelImplCopyWithImpl<$Res>
    extends _$CreateWorkshopModelCopyWithImpl<$Res, _$CreateWorkshopModelImpl>
    implements _$$CreateWorkshopModelImplCopyWith<$Res> {
  __$$CreateWorkshopModelImplCopyWithImpl(
      _$CreateWorkshopModelImpl _value, $Res Function(_$CreateWorkshopModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateWorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? location = freezed,
    Object? entryFee = freezed,
    Object? duration = freezed,
    Object? instructorInfo = freezed,
    Object? tags = freezed,
    Object? participantLimit = freezed,
    Object? status = null,
    Object? registrationLink = freezed,
  }) {
    return _then(_$CreateWorkshopModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      entryFee: freezed == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorInfo: freezed == instructorInfo
          ? _value.instructorInfo
          : instructorInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      participantLimit: freezed == participantLimit
          ? _value.participantLimit
          : participantLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      registrationLink: freezed == registrationLink
          ? _value.registrationLink
          : registrationLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWorkshopModelImpl implements _CreateWorkshopModel {
  _$CreateWorkshopModelImpl(
      {required this.title,
      this.description,
      required this.date,
      this.location,
      @JsonKey(name: 'entry_fee') this.entryFee,
      this.duration,
      @JsonKey(name: 'instructor_info') this.instructorInfo,
      this.tags,
      @JsonKey(name: 'participant_limit') this.participantLimit,
      required this.status,
      @JsonKey(name: 'registration_link') this.registrationLink});

  factory _$CreateWorkshopModelImpl.fromJson(Map<String, dynamic> json) => _$$CreateWorkshopModelImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? location;
  @override
  @JsonKey(name: 'entry_fee')
  final String? entryFee;
  @override
  final String? duration;
  @override
  @JsonKey(name: 'instructor_info')
  final String? instructorInfo;
  @override
  final String? tags;
  @override
  @JsonKey(name: 'participant_limit')
  final int? participantLimit;
  @override
  final String status;
  @override
  @JsonKey(name: 'registration_link')
  final String? registrationLink;

  @override
  String toString() {
    return 'CreateWorkshopModel(title: $title, description: $description, date: $date, location: $location, entryFee: $entryFee, duration: $duration, instructorInfo: $instructorInfo, tags: $tags, participantLimit: $participantLimit, status: $status, registrationLink: $registrationLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWorkshopModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) || other.location == location) &&
            (identical(other.entryFee, entryFee) || other.entryFee == entryFee) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            (identical(other.instructorInfo, instructorInfo) || other.instructorInfo == instructorInfo) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.participantLimit, participantLimit) || other.participantLimit == participantLimit) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.registrationLink, registrationLink) || other.registrationLink == registrationLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, date, location, entryFee, duration, instructorInfo,
      tags, participantLimit, status, registrationLink);

  /// Create a copy of CreateWorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWorkshopModelImplCopyWith<_$CreateWorkshopModelImpl> get copyWith =>
      __$$CreateWorkshopModelImplCopyWithImpl<_$CreateWorkshopModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWorkshopModelImplToJson(
      this,
    );
  }
}

abstract class _CreateWorkshopModel implements CreateWorkshopModel {
  factory _CreateWorkshopModel(
      {required final String title,
      final String? description,
      required final String? date,
      final String? location,
      @JsonKey(name: 'entry_fee') final String? entryFee,
      final String? duration,
      @JsonKey(name: 'instructor_info') final String? instructorInfo,
      final String? tags,
      @JsonKey(name: 'participant_limit') final int? participantLimit,
      required final String status,
      @JsonKey(name: 'registration_link') final String? registrationLink}) = _$CreateWorkshopModelImpl;

  factory _CreateWorkshopModel.fromJson(Map<String, dynamic> json) = _$CreateWorkshopModelImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  String? get date;
  @override
  String? get location;
  @override
  @JsonKey(name: 'entry_fee')
  String? get entryFee;
  @override
  String? get duration;
  @override
  @JsonKey(name: 'instructor_info')
  String? get instructorInfo;
  @override
  String? get tags;
  @override
  @JsonKey(name: 'participant_limit')
  int? get participantLimit;
  @override
  String get status;
  @override
  @JsonKey(name: 'registration_link')
  String? get registrationLink;

  /// Create a copy of CreateWorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateWorkshopModelImplCopyWith<_$CreateWorkshopModelImpl> get copyWith => throw _privateConstructorUsedError;
}
