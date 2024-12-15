import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/workshop_model.dart';

part 'workshop_notifier.g.dart';

@riverpod
class WorkshopNotifier extends AutoDisposeAsyncNotifier<List<WorkshopModel>> {
  @override
  FutureOr<List<WorkshopModel>> build() async {
    try {
      state = const AsyncValue.loading();

      final workshops = await fetchWorkshops();
      return workshops;
    } catch (e, stackTrace) {
      state = AsyncValue.error('Error fetching workshops: $e', stackTrace);
      return [];
    }
  }

  Future<List<WorkshopModel>> fetchWorkshops() async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/events/workshopsfeed',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching workshops: $error');
        },
        (data) {
          final workshops = (data['data'] as List).map((item) {
            return WorkshopModel.fromJson(item);
          }).toList();

          return workshops;
        },
      );
    } catch (e) {
      throw Exception('Error fetching workshops: $e');
    }
  }

  Future<WorkshopModel?> fetchWorkshopDetails(String id) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      final response = await apiService.request(
        HttpMethod.get,
        '/api/v1/events/workshop/$id',
      );

      return response.fold(
        (error) {
          throw Exception('Error fetching workshop details: $error');
        },
        (data) {
          final workshop = WorkshopModel.fromJson(data['data']);
          return workshop;
        },
      );
    } catch (e) {
      throw Exception('Error fetching workshop details: $e');
    }
  }
}
