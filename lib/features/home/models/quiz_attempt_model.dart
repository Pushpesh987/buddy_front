import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_attempt_model.freezed.dart';
part 'quiz_attempt_model.g.dart';

@freezed
class QuizAttempt with _$QuizAttempt {
  const factory QuizAttempt({
    @JsonKey(name: 'question_id') required int questionId,
    @JsonKey(name: 'is_correct') required bool isCorrect,
  }) = _QuizAttempt;

  factory QuizAttempt.fromJson(Map<String, dynamic> json) => _$QuizAttemptFromJson(json);
}
