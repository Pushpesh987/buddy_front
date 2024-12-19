import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../viewmodel/question_vm/quiz_attempt_notifier.dart';
import '../../../../viewmodel/question_vm/bonus_question_notifier.dart';

class BonusPage extends ConsumerStatefulWidget {
  const BonusPage({super.key});

  @override
  _BonusPageState createState() => _BonusPageState();
}

class _BonusPageState extends ConsumerState<BonusPage> {
  Map<int, String?> userAnswers = {}; // To store the user answers
  Map<int, bool> answered = {}; // To track if the question has been answered

  @override
  Widget build(BuildContext context) {
    final bonusQuestionsState = ref.watch(bonusQuestionNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bonus Quiz')),
      body: bonusQuestionsState.when(
        data: (questions) {
          if (questions.isEmpty) {
            // If there are no bonus questions, show a message
            return const Center(
              child: Text(
                'Bonus questions are over now, come tomorrow!',
                style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
            );
          }

          // Otherwise, display the bonus questions
          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final question = questions[index];
              final userAnswer = userAnswers[question.id];
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
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            userAnswers[question.id] = value; // Store the user input
                          });
                        },
                        enabled: !isAnswered, // Disable after answering
                        decoration: InputDecoration(
                          labelText: 'Type your answer',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorText: (isAnswered && userAnswer != question.correctAnswer) ? 'Incorrect Answer' : null,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      if (isAnswered)
                        Text(
                          userAnswer == question.correctAnswer
                              ? 'Correct!'
                              : 'Incorrect. Correct Answer: ${question.correctAnswer}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: userAnswer == question.correctAnswer ? Colors.green : Colors.red,
                          ),
                        ),
                      const SizedBox(height: 12.0),
                      ElevatedButton(
                        onPressed: isAnswered
                            ? null
                            : () {
                                setState(() {
                                  final isCorrect = userAnswer == question.correctAnswer;
                                  answered[question.id] = true;
                                  _submitAnswer(question.id, isCorrect);
                                });
                              },
                        child: const Text('Submit Answer'),
                      ),
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

  void _submitAnswer(int questionId, bool isCorrect) {
    ref.read(quizAttemptNotifierProvider.notifier).submitAnswer(questionId, isCorrect);
  }
}
