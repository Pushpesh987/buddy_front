// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workshop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkshopModel _$WorkshopModelFromJson(Map<String, dynamic> json) {
  return _WorkshopModel.fromJson(json);
}

/// @nodoc
mixin _$WorkshopModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_fee')
  String? get entryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'Duration')
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'instructor_info')
  String? get instructorInfo => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'participant_limit')
  int? get participantLimit => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_link')
  String? get registrationLink => throw _privateConstructorUsedError;

  /// Serializes this WorkshopModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkshopModelCopyWith<WorkshopModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkshopModelCopyWith<$Res> {
  factory $WorkshopModelCopyWith(WorkshopModel value, $Res Function(WorkshopModel) then) =
      _$WorkshopModelCopyWithImpl<$Res, WorkshopModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
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
      String status,
      @JsonKey(name: 'registration_link') String? registrationLink});
}

/// @nodoc
class _$WorkshopModelCopyWithImpl<$Res, $Val extends WorkshopModel> implements $WorkshopModelCopyWith<$Res> {
  _$WorkshopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? location = freezed,
    Object? media = freezed,
    Object? entryFee = freezed,
    Object? duration = freezed,
    Object? instructorInfo = freezed,
    Object? tags = freezed,
    Object? participantLimit = freezed,
    Object? status = null,
    Object? registrationLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
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
abstract class _$$WorkshopModelImplCopyWith<$Res> implements $WorkshopModelCopyWith<$Res> {
  factory _$$WorkshopModelImplCopyWith(_$WorkshopModelImpl value, $Res Function(_$WorkshopModelImpl) then) =
      __$$WorkshopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
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
      String status,
      @JsonKey(name: 'registration_link') String? registrationLink});
}

/// @nodoc
class __$$WorkshopModelImplCopyWithImpl<$Res> extends _$WorkshopModelCopyWithImpl<$Res, _$WorkshopModelImpl>
    implements _$$WorkshopModelImplCopyWith<$Res> {
  __$$WorkshopModelImplCopyWithImpl(_$WorkshopModelImpl _value, $Res Function(_$WorkshopModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? location = freezed,
    Object? media = freezed,
    Object? entryFee = freezed,
    Object? duration = freezed,
    Object? instructorInfo = freezed,
    Object? tags = freezed,
    Object? participantLimit = freezed,
    Object? status = null,
    Object? registrationLink = freezed,
  }) {
    return _then(_$WorkshopModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
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
class _$WorkshopModelImpl implements _WorkshopModel {
  _$WorkshopModelImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      this.title,
      this.description,
      this.date,
      this.location,
      this.media,
      @JsonKey(name: 'entry_fee') this.entryFee,
      @JsonKey(name: 'Duration') this.duration,
      @JsonKey(name: 'instructor_info') this.instructorInfo,
      this.tags,
      @JsonKey(name: 'participant_limit') this.participantLimit,
      required this.status,
      @JsonKey(name: 'registration_link') this.registrationLink});

  factory _$WorkshopModelImpl.fromJson(Map<String, dynamic> json) => _$$WorkshopModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? location;
  @override
  final String? media;
  @override
  @JsonKey(name: 'entry_fee')
  final String? entryFee;
  @override
  @JsonKey(name: 'Duration')
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
    return 'WorkshopModel(id: $id, userId: $userId, title: $title, description: $description, date: $date, location: $location, media: $media, entryFee: $entryFee, duration: $duration, instructorInfo: $instructorInfo, tags: $tags, participantLimit: $participantLimit, status: $status, registrationLink: $registrationLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkshopModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) || other.location == location) &&
            (identical(other.media, media) || other.media == media) &&
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
  int get hashCode => Object.hash(runtimeType, id, userId, title, description, date, location, media, entryFee,
      duration, instructorInfo, tags, participantLimit, status, registrationLink);

  /// Create a copy of WorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkshopModelImplCopyWith<_$WorkshopModelImpl> get copyWith =>
      __$$WorkshopModelImplCopyWithImpl<_$WorkshopModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkshopModelImplToJson(
      this,
    );
  }
}

abstract class _WorkshopModel implements WorkshopModel {
  factory _WorkshopModel(
      {final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      final String? title,
      final String? description,
      final String? date,
      final String? location,
      final String? media,
      @JsonKey(name: 'entry_fee') final String? entryFee,
      @JsonKey(name: 'Duration') final String? duration,
      @JsonKey(name: 'instructor_info') final String? instructorInfo,
      final String? tags,
      @JsonKey(name: 'participant_limit') final int? participantLimit,
      required final String status,
      @JsonKey(name: 'registration_link') final String? registrationLink}) = _$WorkshopModelImpl;

  factory _WorkshopModel.fromJson(Map<String, dynamic> json) = _$WorkshopModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get date;
  @override
  String? get location;
  @override
  String? get media;
  @override
  @JsonKey(name: 'entry_fee')
  String? get entryFee;
  @override
  @JsonKey(name: 'Duration')
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

  /// Create a copy of WorkshopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkshopModelImplCopyWith<_$WorkshopModelImpl> get copyWith => throw _privateConstructorUsedError;
}
