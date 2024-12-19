import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/quiz_attempt_model.dart';

part 'quiz_attempt_notifier.g.dart';

@riverpod
class QuizAttemptNotifier extends AutoDisposeAsyncNotifier<void> {
  Future<void> submitAnswer(int questionId, bool isCorrect) async {
    final apiService = ref.watch(apiServiceProvider);

    final quizAttempt = QuizAttempt(
      questionId: questionId,
      isCorrect: isCorrect,
    );

    try {
      final response = await apiService.request(
        HttpMethod.post,
        '/api/v1/question/submit',
        data: quizAttempt.toJson(),
      );

      response.fold(
        (error) {
          throw Exception('Error submitting answer: $error');
        },
        (data) {
          print('Answer submitted successfully');
        },
      );
    } catch (e) {
      throw Exception('Error submitting answer: $e');
    }
  }

  @override
  FutureOr<void> build() async {
    state = const AsyncValue.loading();
    state = const AsyncValue.data(null);
  }
}
