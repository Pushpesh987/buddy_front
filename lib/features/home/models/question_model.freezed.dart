// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonKey(name: 'question_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String get correctAnswer => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) = _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') int id,
      @JsonKey(name: 'question_text') String questionText,
      @JsonKey(name: 'question_type') String questionType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<String> options,
      @JsonKey(name: 'correct_answer') String correctAnswer});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionText = null,
    Object? questionType = null,
    Object? createdAt = null,
    Object? options = null,
    Object? correctAnswer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(_$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id') int id,
      @JsonKey(name: 'question_text') String questionText,
      @JsonKey(name: 'question_type') String questionType,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<String> options,
      @JsonKey(name: 'correct_answer') String correctAnswer});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(_$QuestionImpl _value, $Res Function(_$QuestionImpl) _then) : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionText = null,
    Object? questionType = null,
    Object? createdAt = null,
    Object? options = null,
    Object? correctAnswer = null,
  }) {
    return _then(_$QuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  const _$QuestionImpl(
      {@JsonKey(name: 'question_id') required this.id,
      @JsonKey(name: 'question_text') required this.questionText,
      @JsonKey(name: 'question_type') required this.questionType,
      @JsonKey(name: 'created_at') required this.createdAt,
      required final List<String> options,
      @JsonKey(name: 'correct_answer') required this.correctAnswer})
      : _options = options;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) => _$$QuestionImplFromJson(json);

  @override
  @JsonKey(name: 'question_id')
  final int id;
  @override
  @JsonKey(name: 'question_text')
  final String questionText;
  @override
  @JsonKey(name: 'question_type')
  final String questionType;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  @JsonKey(name: 'correct_answer')
  final String correctAnswer;

  @override
  String toString() {
    return 'Question(id: $id, questionText: $questionText, questionType: $questionType, createdAt: $createdAt, options: $options, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionText, questionText) || other.questionText == questionText) &&
            (identical(other.questionType, questionType) || other.questionType == questionType) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, questionText, questionType, createdAt,
      const DeepCollectionEquality().hash(_options), correctAnswer);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {@JsonKey(name: 'question_id') required final int id,
      @JsonKey(name: 'question_text') required final String questionText,
      @JsonKey(name: 'question_type') required final String questionType,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      required final List<String> options,
      @JsonKey(name: 'correct_answer') required final String correctAnswer}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) = _$QuestionImpl.fromJson;

  @override
  @JsonKey(name: 'question_id')
  int get id;
  @override
  @JsonKey(name: 'question_text')
  String get questionText;
  @override
  @JsonKey(name: 'question_type')
  String get questionType;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  List<String> get options;
  @override
  @JsonKey(name: 'correct_answer')
  String get correctAnswer;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith => throw _privateConstructorUsedError;
}
