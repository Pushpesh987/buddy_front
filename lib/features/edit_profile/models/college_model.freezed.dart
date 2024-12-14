// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'college_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollegeModel _$CollegeModelFromJson(Map<String, dynamic> json) {
  return _CollegeModel.fromJson(json);
}

/// @nodoc
mixin _$CollegeModel {
  @JsonKey(name: 'college_name')
  String? get collegeName => throw _privateConstructorUsedError;

  /// Serializes this CollegeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollegeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollegeModelCopyWith<CollegeModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollegeModelCopyWith<$Res> {
  factory $CollegeModelCopyWith(CollegeModel value, $Res Function(CollegeModel) then) =
      _$CollegeModelCopyWithImpl<$Res, CollegeModel>;
  @useResult
  $Res call({@JsonKey(name: 'college_name') String? collegeName});
}

/// @nodoc
class _$CollegeModelCopyWithImpl<$Res, $Val extends CollegeModel> implements $CollegeModelCopyWith<$Res> {
  _$CollegeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollegeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collegeName = freezed,
  }) {
    return _then(_value.copyWith(
      collegeName: freezed == collegeName
          ? _value.collegeName
          : collegeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollegeModelImplCopyWith<$Res> implements $CollegeModelCopyWith<$Res> {
  factory _$$CollegeModelImplCopyWith(_$CollegeModelImpl value, $Res Function(_$CollegeModelImpl) then) =
      __$$CollegeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'college_name') String? collegeName});
}

/// @nodoc
class __$$CollegeModelImplCopyWithImpl<$Res> extends _$CollegeModelCopyWithImpl<$Res, _$CollegeModelImpl>
    implements _$$CollegeModelImplCopyWith<$Res> {
  __$$CollegeModelImplCopyWithImpl(_$CollegeModelImpl _value, $Res Function(_$CollegeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollegeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collegeName = freezed,
  }) {
    return _then(_$CollegeModelImpl(
      collegeName: freezed == collegeName
          ? _value.collegeName
          : collegeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollegeModelImpl implements _CollegeModel {
  _$CollegeModelImpl({@JsonKey(name: 'college_name') this.collegeName});

  factory _$CollegeModelImpl.fromJson(Map<String, dynamic> json) => _$$CollegeModelImplFromJson(json);

  @override
  @JsonKey(name: 'college_name')
  final String? collegeName;

  @override
  String toString() {
    return 'CollegeModel(collegeName: $collegeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollegeModelImpl &&
            (identical(other.collegeName, collegeName) || other.collegeName == collegeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, collegeName);

  /// Create a copy of CollegeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollegeModelImplCopyWith<_$CollegeModelImpl> get copyWith =>
      __$$CollegeModelImplCopyWithImpl<_$CollegeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollegeModelImplToJson(
      this,
    );
  }
}

abstract class _CollegeModel implements CollegeModel {
  factory _CollegeModel({@JsonKey(name: 'college_name') final String? collegeName}) = _$CollegeModelImpl;

  factory _CollegeModel.fromJson(Map<String, dynamic> json) = _$CollegeModelImpl.fromJson;

  @override
  @JsonKey(name: 'college_name')
  String? get collegeName;

  /// Create a copy of CollegeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollegeModelImplCopyWith<_$CollegeModelImpl> get copyWith => throw _privateConstructorUsedError;
}
