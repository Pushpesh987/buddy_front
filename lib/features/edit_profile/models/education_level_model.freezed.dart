// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EducationLevelModel _$EducationLevelModelFromJson(Map<String, dynamic> json) {
  return _EducationLevelModel.fromJson(json);
}

/// @nodoc
mixin _$EducationLevelModel {
  @JsonKey(name: 'field_name')
  String? get fieldName => throw _privateConstructorUsedError;

  /// Serializes this EducationLevelModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EducationLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationLevelModelCopyWith<EducationLevelModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationLevelModelCopyWith<$Res> {
  factory $EducationLevelModelCopyWith(EducationLevelModel value, $Res Function(EducationLevelModel) then) =
      _$EducationLevelModelCopyWithImpl<$Res, EducationLevelModel>;
  @useResult
  $Res call({@JsonKey(name: 'field_name') String? fieldName});
}

/// @nodoc
class _$EducationLevelModelCopyWithImpl<$Res, $Val extends EducationLevelModel>
    implements $EducationLevelModelCopyWith<$Res> {
  _$EducationLevelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EducationLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = freezed,
  }) {
    return _then(_value.copyWith(
      fieldName: freezed == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationLevelModelImplCopyWith<$Res> implements $EducationLevelModelCopyWith<$Res> {
  factory _$$EducationLevelModelImplCopyWith(
          _$EducationLevelModelImpl value, $Res Function(_$EducationLevelModelImpl) then) =
      __$$EducationLevelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'field_name') String? fieldName});
}

/// @nodoc
class __$$EducationLevelModelImplCopyWithImpl<$Res>
    extends _$EducationLevelModelCopyWithImpl<$Res, _$EducationLevelModelImpl>
    implements _$$EducationLevelModelImplCopyWith<$Res> {
  __$$EducationLevelModelImplCopyWithImpl(
      _$EducationLevelModelImpl _value, $Res Function(_$EducationLevelModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EducationLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = freezed,
  }) {
    return _then(_$EducationLevelModelImpl(
      fieldName: freezed == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationLevelModelImpl implements _EducationLevelModel {
  _$EducationLevelModelImpl({@JsonKey(name: 'field_name') this.fieldName});

  factory _$EducationLevelModelImpl.fromJson(Map<String, dynamic> json) => _$$EducationLevelModelImplFromJson(json);

  @override
  @JsonKey(name: 'field_name')
  final String? fieldName;

  @override
  String toString() {
    return 'EducationLevelModel(fieldName: $fieldName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationLevelModelImpl &&
            (identical(other.fieldName, fieldName) || other.fieldName == fieldName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fieldName);

  /// Create a copy of EducationLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationLevelModelImplCopyWith<_$EducationLevelModelImpl> get copyWith =>
      __$$EducationLevelModelImplCopyWithImpl<_$EducationLevelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationLevelModelImplToJson(
      this,
    );
  }
}

abstract class _EducationLevelModel implements EducationLevelModel {
  factory _EducationLevelModel({@JsonKey(name: 'field_name') final String? fieldName}) = _$EducationLevelModelImpl;

  factory _EducationLevelModel.fromJson(Map<String, dynamic> json) = _$EducationLevelModelImpl.fromJson;

  @override
  @JsonKey(name: 'field_name')
  String? get fieldName;

  /// Create a copy of EducationLevelModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationLevelModelImplCopyWith<_$EducationLevelModelImpl> get copyWith => throw _privateConstructorUsedError;
}
