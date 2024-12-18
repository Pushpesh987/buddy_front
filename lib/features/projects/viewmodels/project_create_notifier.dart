import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/file_service.dart';
import '../../../core/service_provider.dart/file_service_provider.dart';
import '../models/create_project_model.dart';

part 'profile_create_notifier.g.dart';

@riverpod
class ProfileCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createProjects(CreateProjectModel newProjects, {File? imageFile}) async {
    final fileUploadService = ref.watch(fileUploadServiceProvider);

    try {
      final requestBody = newProjects.toJson();

      final response = await fileUploadService.uploadDataWithFile(
        HttpMethodFile.post,
        '/api/v1/events/project',
        data: requestBody,
        file: imageFile,
        keyName: 'media',
      );

      response.fold(
        (error) {
          throw Exception('Error creating project: $error');
        },
        (data) {
          print("Project created successfully: $data");
        },
      );
    } catch (e) {
      print("Error occurred while creating the project: $e");
      throw Exception('Error creating project: $e');
    }
  }
}
