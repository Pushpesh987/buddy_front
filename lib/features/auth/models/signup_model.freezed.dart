// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) {
  return _SignUpModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpModel {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this SignUpModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpModelCopyWith<SignUpModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpModelCopyWith<$Res> {
  factory $SignUpModelCopyWith(SignUpModel value, $Res Function(SignUpModel) then) =
      _$SignUpModelCopyWithImpl<$Res, SignUpModel>;
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class _$SignUpModelCopyWithImpl<$Res, $Val extends SignUpModel> implements $SignUpModelCopyWith<$Res> {
  _$SignUpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpModelImplCopyWith<$Res> implements $SignUpModelCopyWith<$Res> {
  factory _$$SignUpModelImplCopyWith(_$SignUpModelImpl value, $Res Function(_$SignUpModelImpl) then) =
      __$$SignUpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class __$$SignUpModelImplCopyWithImpl<$Res> extends _$SignUpModelCopyWithImpl<$Res, _$SignUpModelImpl>
    implements _$$SignUpModelImplCopyWith<$Res> {
  __$$SignUpModelImplCopyWithImpl(_$SignUpModelImpl _value, $Res Function(_$SignUpModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignUpModelImpl implements _SignUpModel {
  const _$SignUpModelImpl({required this.username, required this.email, required this.password});

  factory _$SignUpModelImpl.fromJson(Map<String, dynamic> json) => _$$SignUpModelImplFromJson(json);

  @override
  final String username;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpModel(username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpModelImpl &&
            (identical(other.username, username) || other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) || other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, email, password);

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpModelImplCopyWith<_$SignUpModelImpl> get copyWith =>
      __$$SignUpModelImplCopyWithImpl<_$SignUpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpModelImplToJson(
      this,
    );
  }
}

abstract class _SignUpModel implements SignUpModel {
  const factory _SignUpModel(
      {required final String username,
      required final String email,
      required final String password}) = _$SignUpModelImpl;

  factory _SignUpModel.fromJson(Map<String, dynamic> json) = _$SignUpModelImpl.fromJson;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpModelImplCopyWith<_$SignUpModelImpl> get copyWith => throw _privateConstructorUsedError;
}
