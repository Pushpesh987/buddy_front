// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) {
  return _SkillModel.fromJson(json);
}

/// @nodoc
mixin _$SkillModel {
  @JsonKey(name: 'skill_name')
  String? get skillName => throw _privateConstructorUsedError;

  /// Serializes this SkillModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillModelCopyWith<SkillModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillModelCopyWith<$Res> {
  factory $SkillModelCopyWith(SkillModel value, $Res Function(SkillModel) then) =
      _$SkillModelCopyWithImpl<$Res, SkillModel>;
  @useResult
  $Res call({@JsonKey(name: 'skill_name') String? skillName});
}

/// @nodoc
class _$SkillModelCopyWithImpl<$Res, $Val extends SkillModel> implements $SkillModelCopyWith<$Res> {
  _$SkillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillName = freezed,
  }) {
    return _then(_value.copyWith(
      skillName: freezed == skillName
          ? _value.skillName
          : skillName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillModelImplCopyWith<$Res> implements $SkillModelCopyWith<$Res> {
  factory _$$SkillModelImplCopyWith(_$SkillModelImpl value, $Res Function(_$SkillModelImpl) then) =
      __$$SkillModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'skill_name') String? skillName});
}

/// @nodoc
class __$$SkillModelImplCopyWithImpl<$Res> extends _$SkillModelCopyWithImpl<$Res, _$SkillModelImpl>
    implements _$$SkillModelImplCopyWith<$Res> {
  __$$SkillModelImplCopyWithImpl(_$SkillModelImpl _value, $Res Function(_$SkillModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillName = freezed,
  }) {
    return _then(_$SkillModelImpl(
      skillName: freezed == skillName
          ? _value.skillName
          : skillName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillModelImpl implements _SkillModel {
  _$SkillModelImpl({@JsonKey(name: 'skill_name') this.skillName});

  factory _$SkillModelImpl.fromJson(Map<String, dynamic> json) => _$$SkillModelImplFromJson(json);

  @override
  @JsonKey(name: 'skill_name')
  final String? skillName;

  @override
  String toString() {
    return 'SkillModel(skillName: $skillName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillModelImpl &&
            (identical(other.skillName, skillName) || other.skillName == skillName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, skillName);

  /// Create a copy of SkillModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillModelImplCopyWith<_$SkillModelImpl> get copyWith =>
      __$$SkillModelImplCopyWithImpl<_$SkillModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillModelImplToJson(
      this,
    );
  }
}

abstract class _SkillModel implements SkillModel {
  factory _SkillModel({@JsonKey(name: 'skill_name') final String? skillName}) = _$SkillModelImpl;

  factory _SkillModel.fromJson(Map<String, dynamic> json) = _$SkillModelImpl.fromJson;

  @override
  @JsonKey(name: 'skill_name')
  String? get skillName;

  /// Create a copy of SkillModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillModelImplCopyWith<_$SkillModelImpl> get copyWith => throw _privateConstructorUsedError;
}
