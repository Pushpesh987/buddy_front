// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_comunities_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllComunitiesModel _$AllComunitiesModelFromJson(Map<String, dynamic> json) {
  return _AllComunitiesModel.fromJson(json);
}

/// @nodoc
mixin _$AllComunitiesModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AllComunitiesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllComunitiesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllComunitiesModelCopyWith<AllComunitiesModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllComunitiesModelCopyWith<$Res> {
  factory $AllComunitiesModelCopyWith(AllComunitiesModel value, $Res Function(AllComunitiesModel) then) =
      _$AllComunitiesModelCopyWithImpl<$Res, AllComunitiesModel>;
  @useResult
  $Res call({int id, String name, String? description, @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$AllComunitiesModelCopyWithImpl<$Res, $Val extends AllComunitiesModel>
    implements $AllComunitiesModelCopyWith<$Res> {
  _$AllComunitiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllComunitiesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllComunitiesModelImplCopyWith<$Res> implements $AllComunitiesModelCopyWith<$Res> {
  factory _$$AllComunitiesModelImplCopyWith(
          _$AllComunitiesModelImpl value, $Res Function(_$AllComunitiesModelImpl) then) =
      __$$AllComunitiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? description, @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$AllComunitiesModelImplCopyWithImpl<$Res>
    extends _$AllComunitiesModelCopyWithImpl<$Res, _$AllComunitiesModelImpl>
    implements _$$AllComunitiesModelImplCopyWith<$Res> {
  __$$AllComunitiesModelImplCopyWithImpl(
      _$AllComunitiesModelImpl _value, $Res Function(_$AllComunitiesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllComunitiesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$AllComunitiesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllComunitiesModelImpl implements _AllComunitiesModel {
  const _$AllComunitiesModelImpl(
      {required this.id, required this.name, this.description, @JsonKey(name: 'created_at') required this.createdAt});

  factory _$AllComunitiesModelImpl.fromJson(Map<String, dynamic> json) => _$$AllComunitiesModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'AllComunitiesModel(id: $id, name: $name, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllComunitiesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, createdAt);

  /// Create a copy of AllComunitiesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllComunitiesModelImplCopyWith<_$AllComunitiesModelImpl> get copyWith =>
      __$$AllComunitiesModelImplCopyWithImpl<_$AllComunitiesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllComunitiesModelImplToJson(
      this,
    );
  }
}

abstract class _AllComunitiesModel implements AllComunitiesModel {
  const factory _AllComunitiesModel(
      {required final int id,
      required final String name,
      final String? description,
      @JsonKey(name: 'created_at') required final DateTime createdAt}) = _$AllComunitiesModelImpl;

  factory _AllComunitiesModel.fromJson(Map<String, dynamic> json) = _$AllComunitiesModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of AllComunitiesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllComunitiesModelImplCopyWith<_$AllComunitiesModelImpl> get copyWith => throw _privateConstructorUsedError;
}
