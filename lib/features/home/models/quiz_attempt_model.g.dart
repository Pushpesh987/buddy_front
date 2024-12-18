// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_attempt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizAttemptImpl _$$QuizAttemptImplFromJson(Map<String, dynamic> json) => _$QuizAttemptImpl(
      questionId: (json['question_id'] as num).toInt(),
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$$QuizAttemptImplToJson(_$QuizAttemptImpl instance) => <String, dynamic>{
      'question_id': instance.questionId,
      'is_correct': instance.isCorrect,
    };
