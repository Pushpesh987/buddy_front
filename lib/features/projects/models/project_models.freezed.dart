// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModels _$ProjectModelsFromJson(Map<String, dynamic> json) {
  return _ProjectModels.fromJson(json);
}

/// @nodoc
mixin _$ProjectModels {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  String? get teamMembers => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get sponsors => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_link')
  String? get projectLink => throw _privateConstructorUsedError;
  String? get goals => throw _privateConstructorUsedError;
  @JsonKey(name: 'domain')
  String? get domain => throw _privateConstructorUsedError;

  /// Serializes this ProjectModels to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectModelsCopyWith<ProjectModels> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelsCopyWith<$Res> {
  factory $ProjectModelsCopyWith(ProjectModels value, $Res Function(ProjectModels) then) =
      _$ProjectModelsCopyWithImpl<$Res, ProjectModels>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      String? title,
      String? description,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? location,
      String? media,
      String? tags,
      String? teamMembers,
      String? status,
      String? sponsors,
      @JsonKey(name: 'project_link') String? projectLink,
      String? goals,
      @JsonKey(name: 'domain') String? domain});
}

/// @nodoc
class _$ProjectModelsCopyWithImpl<$Res, $Val extends ProjectModels> implements $ProjectModelsCopyWith<$Res> {
  _$ProjectModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? location = freezed,
    Object? media = freezed,
    Object? tags = freezed,
    Object? teamMembers = freezed,
    Object? status = freezed,
    Object? sponsors = freezed,
    Object? projectLink = freezed,
    Object? goals = freezed,
    Object? domain = freezed,
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      teamMembers: freezed == teamMembers
          ? _value.teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      sponsors: freezed == sponsors
          ? _value.sponsors
          : sponsors // ignore: cast_nullable_to_non_nullable
              as String?,
      projectLink: freezed == projectLink
          ? _value.projectLink
          : projectLink // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModelsImplCopyWith<$Res> implements $ProjectModelsCopyWith<$Res> {
  factory _$$ProjectModelsImplCopyWith(_$ProjectModelsImpl value, $Res Function(_$ProjectModelsImpl) then) =
      __$$ProjectModelsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      String? title,
      String? description,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? location,
      String? media,
      String? tags,
      String? teamMembers,
      String? status,
      String? sponsors,
      @JsonKey(name: 'project_link') String? projectLink,
      String? goals,
      @JsonKey(name: 'domain') String? domain});
}

/// @nodoc
class __$$ProjectModelsImplCopyWithImpl<$Res> extends _$ProjectModelsCopyWithImpl<$Res, _$ProjectModelsImpl>
    implements _$$ProjectModelsImplCopyWith<$Res> {
  __$$ProjectModelsImplCopyWithImpl(_$ProjectModelsImpl _value, $Res Function(_$ProjectModelsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? location = freezed,
    Object? media = freezed,
    Object? tags = freezed,
    Object? teamMembers = freezed,
    Object? status = freezed,
    Object? sponsors = freezed,
    Object? projectLink = freezed,
    Object? goals = freezed,
    Object? domain = freezed,
  }) {
    return _then(_$ProjectModelsImpl(
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
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      teamMembers: freezed == teamMembers
          ? _value.teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      sponsors: freezed == sponsors
          ? _value.sponsors
          : sponsors // ignore: cast_nullable_to_non_nullable
              as String?,
      projectLink: freezed == projectLink
          ? _value.projectLink
          : projectLink // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: freezed == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelsImpl implements _ProjectModels {
  _$ProjectModelsImpl(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      this.title,
      this.description,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      this.location,
      this.media,
      this.tags,
      this.teamMembers,
      this.status,
      this.sponsors,
      @JsonKey(name: 'project_link') this.projectLink,
      this.goals,
      @JsonKey(name: 'domain') this.domain});

  factory _$ProjectModelsImpl.fromJson(Map<String, dynamic> json) => _$$ProjectModelsImplFromJson(json);

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
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  final String? location;
  @override
  final String? media;
  @override
  final String? tags;
  @override
  final String? teamMembers;
  @override
  final String? status;
  @override
  final String? sponsors;
  @override
  @JsonKey(name: 'project_link')
  final String? projectLink;
  @override
  final String? goals;
  @override
  @JsonKey(name: 'domain')
  final String? domain;

  @override
  String toString() {
    return 'ProjectModels(id: $id, userId: $userId, title: $title, description: $description, startDate: $startDate, endDate: $endDate, location: $location, media: $media, tags: $tags, teamMembers: $teamMembers, status: $status, sponsors: $sponsors, projectLink: $projectLink, goals: $goals, domain: $domain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.startDate, startDate) || other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) || other.location == location) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.teamMembers, teamMembers) || other.teamMembers == teamMembers) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sponsors, sponsors) || other.sponsors == sponsors) &&
            (identical(other.projectLink, projectLink) || other.projectLink == projectLink) &&
            (identical(other.goals, goals) || other.goals == goals) &&
            (identical(other.domain, domain) || other.domain == domain));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, title, description, startDate, endDate, location, media,
      tags, teamMembers, status, sponsors, projectLink, goals, domain);

  /// Create a copy of ProjectModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelsImplCopyWith<_$ProjectModelsImpl> get copyWith =>
      __$$ProjectModelsImplCopyWithImpl<_$ProjectModelsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelsImplToJson(
      this,
    );
  }
}

abstract class _ProjectModels implements ProjectModels {
  factory _ProjectModels(
      {final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      final String? title,
      final String? description,
      @JsonKey(name: 'start_date') final String? startDate,
      @JsonKey(name: 'end_date') final String? endDate,
      final String? location,
      final String? media,
      final String? tags,
      final String? teamMembers,
      final String? status,
      final String? sponsors,
      @JsonKey(name: 'project_link') final String? projectLink,
      final String? goals,
      @JsonKey(name: 'domain') final String? domain}) = _$ProjectModelsImpl;

  factory _ProjectModels.fromJson(Map<String, dynamic> json) = _$ProjectModelsImpl.fromJson;

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
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  String? get location;
  @override
  String? get media;
  @override
  String? get tags;
  @override
  String? get teamMembers;
  @override
  String? get status;
  @override
  String? get sponsors;
  @override
  @JsonKey(name: 'project_link')
  String? get projectLink;
  @override
  String? get goals;
  @override
  @JsonKey(name: 'domain')
  String? get domain;

  /// Create a copy of ProjectModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectModelsImplCopyWith<_$ProjectModelsImpl> get copyWith => throw _privateConstructorUsedError;
}
