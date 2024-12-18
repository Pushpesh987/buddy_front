// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) => _$QuestionImpl(
      id: (json['question_id'] as num).toInt(),
      questionText: json['question_text'] as String,
      questionType: json['question_type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['correct_answer'] as String,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) => <String, dynamic>{
      'question_id': instance.id,
      'question_text': instance.questionText,
      'question_type': instance.questionType,
      'created_at': instance.createdAt.toIso8601String(),
      'options': instance.options,
      'correct_answer': instance.correctAnswer,
    };
