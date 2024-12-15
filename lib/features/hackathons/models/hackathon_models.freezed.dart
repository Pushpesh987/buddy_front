// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hackathon_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HackathonModels _$HackathonModelsFromJson(Map<String, dynamic> json) {
  return _HackathonModels.fromJson(json);
}

/// @nodoc
mixin _$HackathonModels {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_fee')
  int? get entryFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'prize_pool')
  int? get prizePool => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_deadline')
  String? get registrationDeadline => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizer_name')
  String? get organizerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizer_contact')
  String? get organizerContact => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendee_count')
  int? get attendeeCount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this HackathonModels to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HackathonModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HackathonModelsCopyWith<HackathonModels> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HackathonModelsCopyWith<$Res> {
  factory $HackathonModelsCopyWith(HackathonModels value, $Res Function(HackathonModels) then) =
      _$HackathonModelsCopyWithImpl<$Res, HackathonModels>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
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
      String? status});
}

/// @nodoc
class _$HackathonModelsCopyWithImpl<$Res, $Val extends HackathonModels> implements $HackathonModelsCopyWith<$Res> {
  _$HackathonModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HackathonModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? theme = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? location = freezed,
    Object? entryFee = freezed,
    Object? prizePool = freezed,
    Object? media = freezed,
    Object? registrationDeadline = freezed,
    Object? organizerName = freezed,
    Object? organizerContact = freezed,
    Object? tags = freezed,
    Object? attendeeCount = freezed,
    Object? status = freezed,
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
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
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
      entryFee: freezed == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as int?,
      prizePool: freezed == prizePool
          ? _value.prizePool
          : prizePool // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDeadline: freezed == registrationDeadline
          ? _value.registrationDeadline
          : registrationDeadline // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerName: freezed == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerContact: freezed == organizerContact
          ? _value.organizerContact
          : organizerContact // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      attendeeCount: freezed == attendeeCount
          ? _value.attendeeCount
          : attendeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HackathonModelsImplCopyWith<$Res> implements $HackathonModelsCopyWith<$Res> {
  factory _$$HackathonModelsImplCopyWith(_$HackathonModelsImpl value, $Res Function(_$HackathonModelsImpl) then) =
      __$$HackathonModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
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
      String? status});
}

/// @nodoc
class __$$HackathonModelsImplCopyWithImpl<$Res> extends _$HackathonModelsCopyWithImpl<$Res, _$HackathonModelsImpl>
    implements _$$HackathonModelsImplCopyWith<$Res> {
  __$$HackathonModelsImplCopyWithImpl(_$HackathonModelsImpl _value, $Res Function(_$HackathonModelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HackathonModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? theme = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? location = freezed,
    Object? entryFee = freezed,
    Object? prizePool = freezed,
    Object? media = freezed,
    Object? registrationDeadline = freezed,
    Object? organizerName = freezed,
    Object? organizerContact = freezed,
    Object? tags = freezed,
    Object? attendeeCount = freezed,
    Object? status = freezed,
  }) {
    return _then(_$HackathonModelsImpl(
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
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
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
      entryFee: freezed == entryFee
          ? _value.entryFee
          : entryFee // ignore: cast_nullable_to_non_nullable
              as int?,
      prizePool: freezed == prizePool
          ? _value.prizePool
          : prizePool // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDeadline: freezed == registrationDeadline
          ? _value.registrationDeadline
          : registrationDeadline // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerName: freezed == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerContact: freezed == organizerContact
          ? _value.organizerContact
          : organizerContact // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      attendeeCount: freezed == attendeeCount
          ? _value.attendeeCount
          : attendeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HackathonModelsImpl implements _HackathonModels {
  _$HackathonModelsImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      this.title,
      this.theme,
      this.description,
      this.date,
      this.location,
      @JsonKey(name: 'entry_fee') this.entryFee,
      @JsonKey(name: 'prize_pool') this.prizePool,
      this.media,
      @JsonKey(name: 'registration_deadline') this.registrationDeadline,
      @JsonKey(name: 'organizer_name') this.organizerName,
      @JsonKey(name: 'organizer_contact') this.organizerContact,
      this.tags,
      @JsonKey(name: 'attendee_count') this.attendeeCount,
      this.status});

  factory _$HackathonModelsImpl.fromJson(Map<String, dynamic> json) => _$$HackathonModelsImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? title;
  @override
  final String? theme;
  @override
  final String? description;
  @override
  final String? date;
  @override
  final String? location;
  @override
  @JsonKey(name: 'entry_fee')
  final int? entryFee;
  @override
  @JsonKey(name: 'prize_pool')
  final int? prizePool;
  @override
  final String? media;
  @override
  @JsonKey(name: 'registration_deadline')
  final String? registrationDeadline;
  @override
  @JsonKey(name: 'organizer_name')
  final String? organizerName;
  @override
  @JsonKey(name: 'organizer_contact')
  final String? organizerContact;
  @override
  final String? tags;
  @override
  @JsonKey(name: 'attendee_count')
  final int? attendeeCount;
  @override
  final String? status;

  @override
  String toString() {
    return 'HackathonModels(id: $id, userId: $userId, title: $title, theme: $theme, description: $description, date: $date, location: $location, entryFee: $entryFee, prizePool: $prizePool, media: $media, registrationDeadline: $registrationDeadline, organizerName: $organizerName, organizerContact: $organizerContact, tags: $tags, attendeeCount: $attendeeCount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HackathonModelsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.location, location) || other.location == location) &&
            (identical(other.entryFee, entryFee) || other.entryFee == entryFee) &&
            (identical(other.prizePool, prizePool) || other.prizePool == prizePool) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.registrationDeadline, registrationDeadline) ||
                other.registrationDeadline == registrationDeadline) &&
            (identical(other.organizerName, organizerName) || other.organizerName == organizerName) &&
            (identical(other.organizerContact, organizerContact) || other.organizerContact == organizerContact) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.attendeeCount, attendeeCount) || other.attendeeCount == attendeeCount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, theme, description, date, location, entryFee,
      prizePool, media, registrationDeadline, organizerName, organizerContact, tags, attendeeCount, status);

  /// Create a copy of HackathonModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HackathonModelsImplCopyWith<_$HackathonModelsImpl> get copyWith =>
      __$$HackathonModelsImplCopyWithImpl<_$HackathonModelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HackathonModelsImplToJson(
      this,
    );
  }
}

abstract class _HackathonModels implements HackathonModels {
  factory _HackathonModels(
      {final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      final String? title,
      final String? theme,
      final String? description,
      final String? date,
      final String? location,
      @JsonKey(name: 'entry_fee') final int? entryFee,
      @JsonKey(name: 'prize_pool') final int? prizePool,
      final String? media,
      @JsonKey(name: 'registration_deadline') final String? registrationDeadline,
      @JsonKey(name: 'organizer_name') final String? organizerName,
      @JsonKey(name: 'organizer_contact') final String? organizerContact,
      final String? tags,
      @JsonKey(name: 'attendee_count') final int? attendeeCount,
      final String? status}) = _$HackathonModelsImpl;

  factory _HackathonModels.fromJson(Map<String, dynamic> json) = _$HackathonModelsImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get title;
  @override
  String? get theme;
  @override
  String? get description;
  @override
  String? get date;
  @override
  String? get location;
  @override
  @JsonKey(name: 'entry_fee')
  int? get entryFee;
  @override
  @JsonKey(name: 'prize_pool')
  int? get prizePool;
  @override
  String? get media;
  @override
  @JsonKey(name: 'registration_deadline')
  String? get registrationDeadline;
  @override
  @JsonKey(name: 'organizer_name')
  String? get organizerName;
  @override
  @JsonKey(name: 'organizer_contact')
  String? get organizerContact;
  @override
  String? get tags;
  @override
  @JsonKey(name: 'attendee_count')
  int? get attendeeCount;
  @override
  String? get status;

  /// Create a copy of HackathonModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HackathonModelsImplCopyWith<_$HackathonModelsImpl> get copyWith => throw _privateConstructorUsedError;
}
