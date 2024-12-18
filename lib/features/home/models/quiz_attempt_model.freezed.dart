// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_attempt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizAttempt _$QuizAttemptFromJson(Map<String, dynamic> json) {
  return _QuizAttempt.fromJson(json);
}

/// @nodoc
mixin _$QuizAttempt {
  @JsonKey(name: 'question_id')
  int get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this QuizAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizAttemptCopyWith<QuizAttempt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAttemptCopyWith<$Res> {
  factory $QuizAttemptCopyWith(QuizAttempt value, $Res Function(QuizAttempt) then) =
      _$QuizAttemptCopyWithImpl<$Res, QuizAttempt>;
  @useResult
  $Res call({@JsonKey(name: 'question_id') int questionId, @JsonKey(name: 'is_correct') bool isCorrect});
}

/// @nodoc
class _$QuizAttemptCopyWithImpl<$Res, $Val extends QuizAttempt> implements $QuizAttemptCopyWith<$Res> {
  _$QuizAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizAttemptImplCopyWith<$Res> implements $QuizAttemptCopyWith<$Res> {
  factory _$$QuizAttemptImplCopyWith(_$QuizAttemptImpl value, $Res Function(_$QuizAttemptImpl) then) =
      __$$QuizAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'question_id') int questionId, @JsonKey(name: 'is_correct') bool isCorrect});
}

/// @nodoc
class __$$QuizAttemptImplCopyWithImpl<$Res> extends _$QuizAttemptCopyWithImpl<$Res, _$QuizAttemptImpl>
    implements _$$QuizAttemptImplCopyWith<$Res> {
  __$$QuizAttemptImplCopyWithImpl(_$QuizAttemptImpl _value, $Res Function(_$QuizAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? isCorrect = null,
  }) {
    return _then(_$QuizAttemptImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizAttemptImpl implements _QuizAttempt {
  const _$QuizAttemptImpl(
      {@JsonKey(name: 'question_id') required this.questionId, @JsonKey(name: 'is_correct') required this.isCorrect});

  factory _$QuizAttemptImpl.fromJson(Map<String, dynamic> json) => _$$QuizAttemptImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final int questionId;
  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;

  @override
  String toString() {
    return 'QuizAttempt(questionId: $questionId, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAttemptImpl &&
            (identical(other.questionId, questionId) || other.questionId == questionId) &&
            (identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, questionId, isCorrect);

  /// Create a copy of QuizAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAttemptImplCopyWith<_$QuizAttemptImpl> get copyWith =>
      __$$QuizAttemptImplCopyWithImpl<_$QuizAttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizAttemptImplToJson(
      this,
    );
  }
}

abstract class _QuizAttempt implements QuizAttempt {
  const factory _QuizAttempt(
      {@JsonKey(name: 'question_id') required final int questionId,
      @JsonKey(name: 'is_correct') required final bool isCorrect}) = _$QuizAttemptImpl;

  factory _QuizAttempt.fromJson(Map<String, dynamic> json) = _$QuizAttemptImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  int get questionId;
  @override
  @JsonKey(name: 'is_correct')
  bool get isCorrect;

  /// Create a copy of QuizAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizAttemptImplCopyWith<_$QuizAttemptImpl> get copyWith => throw _privateConstructorUsedError;
}
