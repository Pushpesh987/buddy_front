import 'dart:io';

import 'package:buddy_front/core/api_service/file_service.dart';
import 'package:buddy_front/features/workshops/models/create_workshop_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/service_provider.dart/file_service_provider.dart';

part 'workshop_create_notifier.g.dart';

@riverpod
class WorkshopCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createWorkshop(CreateWorkshopModel newWorkshop, {File? imageFile}) async {
    final fileUploadService = ref.watch(fileUploadServiceProvider);

    try {
      final requestBody = newWorkshop.toJson();
      final response = await fileUploadService.uploadDataWithFile(
        HttpMethodFile.post,
        '/api/v1/events/workshop',
        data: requestBody,
        file: imageFile,
        keyName: 'media',
      );
      response.fold(
        (error) {
          throw Exception('Error creating workshop: $error');
        },
        (data) {},
      );
    } catch (e) {
      throw Exception('Error creating workshop: $e');
    }
  }
}
