import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/create_project_model.dart';

part 'profile_create_notifier.g.dart';

@riverpod
class ProfileCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createProjects(CreateProjectModel newProjects, {File? imageFile}) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      FormData formData = FormData();

      final requestBody = newProjects.toJson();
      requestBody.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      if (imageFile != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(imageFile.path),
        ));
      }

      final response = await apiService.request(
        HttpMethod.post,
        '/api/v1/events/project',
        formData: formData,
      );

      response.fold(
        (error) {
          throw Exception('Error creating project: $error');
        },
        (data) {
          print("project created successfully: $data");
        },
      );
    } catch (e) {
      print("Error occurred while creating the project: $e");
      throw Exception('Error creating project: $e');
    }
  }
}
