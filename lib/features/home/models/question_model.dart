import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    @JsonKey(name: 'question_id') required int id,
    @JsonKey(name: 'question_text') required String questionText,
    @JsonKey(name: 'question_type') required String questionType,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required List<String> options,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
