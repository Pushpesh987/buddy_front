// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_of_study_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FieldOfStudyModel _$FieldOfStudyModelFromJson(Map<String, dynamic> json) {
  return _FieldOfStudyModel.fromJson(json);
}

/// @nodoc
mixin _$FieldOfStudyModel {
  @JsonKey(name: 'level_name')
  String? get levelName => throw _privateConstructorUsedError;

  /// Serializes this FieldOfStudyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FieldOfStudyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldOfStudyModelCopyWith<FieldOfStudyModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldOfStudyModelCopyWith<$Res> {
  factory $FieldOfStudyModelCopyWith(FieldOfStudyModel value, $Res Function(FieldOfStudyModel) then) =
      _$FieldOfStudyModelCopyWithImpl<$Res, FieldOfStudyModel>;
  @useResult
  $Res call({@JsonKey(name: 'level_name') String? levelName});
}

/// @nodoc
class _$FieldOfStudyModelCopyWithImpl<$Res, $Val extends FieldOfStudyModel>
    implements $FieldOfStudyModelCopyWith<$Res> {
  _$FieldOfStudyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldOfStudyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelName = freezed,
  }) {
    return _then(_value.copyWith(
      levelName: freezed == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldOfStudyModelImplCopyWith<$Res> implements $FieldOfStudyModelCopyWith<$Res> {
  factory _$$FieldOfStudyModelImplCopyWith(
          _$FieldOfStudyModelImpl value, $Res Function(_$FieldOfStudyModelImpl) then) =
      __$$FieldOfStudyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'level_name') String? levelName});
}

/// @nodoc
class __$$FieldOfStudyModelImplCopyWithImpl<$Res>
    extends _$FieldOfStudyModelCopyWithImpl<$Res, _$FieldOfStudyModelImpl>
    implements _$$FieldOfStudyModelImplCopyWith<$Res> {
  __$$FieldOfStudyModelImplCopyWithImpl(_$FieldOfStudyModelImpl _value, $Res Function(_$FieldOfStudyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldOfStudyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? levelName = freezed,
  }) {
    return _then(_$FieldOfStudyModelImpl(
      levelName: freezed == levelName
          ? _value.levelName
          : levelName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldOfStudyModelImpl implements _FieldOfStudyModel {
  _$FieldOfStudyModelImpl({@JsonKey(name: 'level_name') this.levelName});

  factory _$FieldOfStudyModelImpl.fromJson(Map<String, dynamic> json) => _$$FieldOfStudyModelImplFromJson(json);

  @override
  @JsonKey(name: 'level_name')
  final String? levelName;

  @override
  String toString() {
    return 'FieldOfStudyModel(levelName: $levelName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldOfStudyModelImpl &&
            (identical(other.levelName, levelName) || other.levelName == levelName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, levelName);

  /// Create a copy of FieldOfStudyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldOfStudyModelImplCopyWith<_$FieldOfStudyModelImpl> get copyWith =>
      __$$FieldOfStudyModelImplCopyWithImpl<_$FieldOfStudyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldOfStudyModelImplToJson(
      this,
    );
  }
}

abstract class _FieldOfStudyModel implements FieldOfStudyModel {
  factory _FieldOfStudyModel({@JsonKey(name: 'level_name') final String? levelName}) = _$FieldOfStudyModelImpl;

  factory _FieldOfStudyModel.fromJson(Map<String, dynamic> json) = _$FieldOfStudyModelImpl.fromJson;

  @override
  @JsonKey(name: 'level_name')
  String? get levelName;

  /// Create a copy of FieldOfStudyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldOfStudyModelImplCopyWith<_$FieldOfStudyModelImpl> get copyWith => throw _privateConstructorUsedError;
}
