import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/question_model.dart';

part 'daily_question_notifier.g.dart';

@riverpod
class DailyQuestionNotifier extends AutoDisposeAsyncNotifier<List<Question>> {
  Future<List<Question>> fetchDailyQuestions() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/question/daily',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching questions: $error');
        },
        (data) {
          if (data['data'] == null || (data['data'] as List).isEmpty) {
            return [];
          }

          final questions = (data['data'] as List)
              .map((item) {
                try {
                  return Question.fromJson(item);
                } catch (e) {
                  return null;
                }
              })
              .where((question) => question != null)
              .toList();

          return questions.cast<Question>();
        },
      );
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }

  @override
  FutureOr<List<Question>> build() async {
    state = const AsyncValue.loading();

    try {
      final questions = await fetchDailyQuestions();
      state = AsyncValue.data(questions);
      return questions;
    } catch (e, stackTrace) {
      print("Error: $e, StackTrace: $stackTrace");
      state = AsyncValue.error('Error fetching daily questions: $e', stackTrace);
      return [];
    }
  }
}
