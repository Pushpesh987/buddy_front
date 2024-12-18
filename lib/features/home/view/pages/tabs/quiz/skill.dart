import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../viewmodel/quiz_attempt_notifier.dart';
import '../../../../viewmodel/skill_question_notifier.dart';

class SkillPage extends ConsumerStatefulWidget {
  const SkillPage({super.key});

  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends ConsumerState<SkillPage> {
  Map<int, String?> selectedAnswers = {};
  Map<int, bool> answered = {};

  @override
  Widget build(BuildContext context) {
    final skillQuestionsState = ref.watch(skillQuestionNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Skill Quiz')),
      body: skillQuestionsState.when(
        data: (questions) {
          if (questions.isEmpty) {
            return Center(
              child: Text(
                'Skill questions are over now, come tomorrow!',
                style: AppTheme.labelLargeStyle.copyWith(
                  color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];
              final selectedAnswer = selectedAnswers[question.id];
              final isAnswered = answered[question.id] ?? false;

              return Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.questionText,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      for (var option in question.options)
                        GestureDetector(
                          onTap: isAnswered
                              ? null
                              : () {
                                  setState(() {
                                    selectedAnswers[question.id] = option;
                                    answered[question.id] = true;
                                    final isCorrect = option == question.correctAnswer;
                                    _submitAnswer(question.id, isCorrect);
                                  });
                                },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            decoration: BoxDecoration(
                              color: _getOptionColor(option, selectedAnswer, question.correctAnswer),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: _getOptionBorderColor(option, selectedAnswer, question.correctAnswer),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: _getOptionTextColor(option, selectedAnswer, question.correctAnswer),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Color _getOptionColor(String option, String? selectedAnswer, String correctAnswer) {
    if (selectedAnswer == null) return Colors.white;
    if (selectedAnswer == option) {
      return selectedAnswer == correctAnswer ? Colors.green : Colors.red;
    }
    return option == correctAnswer ? Colors.green.withOpacity(0.3) : Colors.white;
  }

  Color _getOptionBorderColor(String option, String? selectedAnswer, String correctAnswer) {
    if (selectedAnswer == null) return Colors.grey;
    if (selectedAnswer == option) {
      return selectedAnswer == correctAnswer ? Colors.green : Colors.red;
    }
    return option == correctAnswer ? Colors.green : Colors.grey;
  }

  Color _getOptionTextColor(String option, String? selectedAnswer, String correctAnswer) {
    if (selectedAnswer == null) return Colors.black87;
    if (selectedAnswer == option) {
      return selectedAnswer == correctAnswer ? Colors.white : Colors.white;
    }
    return option == correctAnswer ? Colors.green : Colors.black87;
  }

  void _submitAnswer(int questionId, bool isCorrect) {
    ref.read(quizAttemptNotifierProvider.notifier).submitAnswer(questionId, isCorrect);
  }
}
