// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateProjectModel _$CreateProjectModelFromJson(Map<String, dynamic> json) {
  return _CreateProjectModel.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectModel {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get domain => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_members')
  String? get teamMembers => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get sponsors => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_link')
  String? get projectLink => throw _privateConstructorUsedError;
  String? get goals => throw _privateConstructorUsedError;

  /// Serializes this CreateProjectModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateProjectModelCopyWith<CreateProjectModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProjectModelCopyWith<$Res> {
  factory $CreateProjectModelCopyWith(CreateProjectModel value, $Res Function(CreateProjectModel) then) =
      _$CreateProjectModelCopyWithImpl<$Res, CreateProjectModel>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? domain,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? location,
      String? tags,
      @JsonKey(name: 'team_members') String? teamMembers,
      String? status,
      String? sponsors,
      @JsonKey(name: 'project_link') String? projectLink,
      String? goals});
}

/// @nodoc
class _$CreateProjectModelCopyWithImpl<$Res, $Val extends CreateProjectModel>
    implements $CreateProjectModelCopyWith<$Res> {
  _$CreateProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? domain = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? location = freezed,
    Object? tags = freezed,
    Object? teamMembers = freezed,
    Object? status = freezed,
    Object? sponsors = freezed,
    Object? projectLink = freezed,
    Object? goals = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateProjectModelImplCopyWith<$Res> implements $CreateProjectModelCopyWith<$Res> {
  factory _$$CreateProjectModelImplCopyWith(
          _$CreateProjectModelImpl value, $Res Function(_$CreateProjectModelImpl) then) =
      __$$CreateProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? domain,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? location,
      String? tags,
      @JsonKey(name: 'team_members') String? teamMembers,
      String? status,
      String? sponsors,
      @JsonKey(name: 'project_link') String? projectLink,
      String? goals});
}

/// @nodoc
class __$$CreateProjectModelImplCopyWithImpl<$Res>
    extends _$CreateProjectModelCopyWithImpl<$Res, _$CreateProjectModelImpl>
    implements _$$CreateProjectModelImplCopyWith<$Res> {
  __$$CreateProjectModelImplCopyWithImpl(
      _$CreateProjectModelImpl _value, $Res Function(_$CreateProjectModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? domain = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? location = freezed,
    Object? tags = freezed,
    Object? teamMembers = freezed,
    Object? status = freezed,
    Object? sponsors = freezed,
    Object? projectLink = freezed,
    Object? goals = freezed,
  }) {
    return _then(_$CreateProjectModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      domain: freezed == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateProjectModelImpl implements _CreateProjectModel {
  _$CreateProjectModelImpl(
      {this.title,
      this.description,
      this.domain,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      this.location,
      this.tags,
      @JsonKey(name: 'team_members') this.teamMembers,
      this.status,
      this.sponsors,
      @JsonKey(name: 'project_link') this.projectLink,
      this.goals});

  factory _$CreateProjectModelImpl.fromJson(Map<String, dynamic> json) => _$$CreateProjectModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? domain;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  final String? location;
  @override
  final String? tags;
  @override
  @JsonKey(name: 'team_members')
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
  String toString() {
    return 'CreateProjectModel(title: $title, description: $description, domain: $domain, startDate: $startDate, endDate: $endDate, location: $location, tags: $tags, teamMembers: $teamMembers, status: $status, sponsors: $sponsors, projectLink: $projectLink, goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.startDate, startDate) || other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) || other.location == location) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.teamMembers, teamMembers) || other.teamMembers == teamMembers) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sponsors, sponsors) || other.sponsors == sponsors) &&
            (identical(other.projectLink, projectLink) || other.projectLink == projectLink) &&
            (identical(other.goals, goals) || other.goals == goals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, domain, startDate, endDate, location, tags,
      teamMembers, status, sponsors, projectLink, goals);

  /// Create a copy of CreateProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateProjectModelImplCopyWith<_$CreateProjectModelImpl> get copyWith =>
      __$$CreateProjectModelImplCopyWithImpl<_$CreateProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateProjectModelImplToJson(
      this,
    );
  }
}

abstract class _CreateProjectModel implements CreateProjectModel {
  factory _CreateProjectModel(
      {final String? title,
      final String? description,
      final String? domain,
      @JsonKey(name: 'start_date') final String? startDate,
      @JsonKey(name: 'end_date') final String? endDate,
      final String? location,
      final String? tags,
      @JsonKey(name: 'team_members') final String? teamMembers,
      final String? status,
      final String? sponsors,
      @JsonKey(name: 'project_link') final String? projectLink,
      final String? goals}) = _$CreateProjectModelImpl;

  factory _CreateProjectModel.fromJson(Map<String, dynamic> json) = _$CreateProjectModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get domain;
  @override
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  String? get location;
  @override
  String? get tags;
  @override
  @JsonKey(name: 'team_members')
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

  /// Create a copy of CreateProjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateProjectModelImplCopyWith<_$CreateProjectModelImpl> get copyWith => throw _privateConstructorUsedError;
}
