import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';
import '../models/create_hackathon_model.dart';

part 'hackathon_create_notifier.g.dart';

@riverpod
class HackathonCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createHackathon(CreateHackathonModel newHackathon, {File? imageFile}) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      FormData formData = FormData();

      final requestBody = newHackathon.toJson();
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
        '/api/v1/events/event',
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
