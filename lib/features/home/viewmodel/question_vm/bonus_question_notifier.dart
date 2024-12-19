import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/api_service/api_service.dart';
import '../../../../core/service_provider.dart/service_provider.dart';
import '../../models/question_model.dart';

part 'bonus_question_notifier.g.dart';

@riverpod
class BonusQuestionNotifier extends AutoDisposeAsyncNotifier<List<Question>> {
  Future<List<Question>> fetchBonusQuestions() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/question/bonus',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching bonus questions: $error');
        },
        (data) {
          print("Response data: $data");

          final questionsData = data['data'];

          if (questionsData == null || !(questionsData is List)) {
            return [];
          }

          final questions = questionsData
              .map((item) {
                try {
                  return Question.fromJson(item);
                } catch (e) {
                  return null;
                }
              })
              .where((question) => question != null)
              .toList();

          print("Parsed questions: $questions");

          return questions.cast<Question>();
        },
      );
    } catch (e) {
      print('Unexpected error while fetching questions: $e');
      throw Exception('Unexpected error fetching bonus questions: $e');
    }
  }

  @override
  FutureOr<List<Question>> build() async {
    state = const AsyncValue.loading();

    try {
      final questions = await fetchBonusQuestions();
      state = AsyncValue.data(questions);
      return questions;
    } catch (e, stackTrace) {
      print("Error fetching bonus questions: $e, StackTrace: $stackTrace");
      state = AsyncValue.error('Error fetching bonus questions: $e', stackTrace);
      return [];
    }
  }
}
