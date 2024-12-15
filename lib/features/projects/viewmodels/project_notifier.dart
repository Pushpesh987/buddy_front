import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/project_models.dart';

part 'project_notifier.g.dart';

@riverpod
class ProjectNotifier extends AutoDisposeAsyncNotifier<List<ProjectModels>> {
  @override
  FutureOr<List<ProjectModels>> build() async {
    try {
      state = const AsyncValue.loading();

      final projects = await fetchProjects();
      return projects;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching projects: $e', stackTrace);
      return [];
    }
  }

  Future<List<ProjectModels>> fetchProjects() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/events/projectsfeed',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching projects: $error');
        },
        (data) {
          final projects = (data['data'] as List).map((item) {
            return ProjectModels.fromJson(item);
          }).toList();

          return projects;
        },
      );
    } catch (e) {
      throw Exception('Error fetching projects: $e');
    }
  }

  Future<ProjectModels?> fetchProjectDetails(String id) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/events/project/$id',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching project details: $error');
        },
        (data) {
          final project = ProjectModels.fromJson(data['data']);
          return project;
        },
      );
    } catch (e) {
      throw Exception('Error fetching project details: $e');
    }
  }
}
