import 'dart:io';

import 'package:buddy_front/features/workshops/models/create_workshop_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/api_service/api_service.dart';
import '../../../core/service_provider.dart/service_provider.dart';

part 'workshop_create_notifier.g.dart';

@riverpod
class WorkshopCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createWorkshop(CreateWorkshopModel newWorkshop, {File? imageFile}) async {
    final apiService = ref.watch(apiServiceProvider);

    try {
      FormData formData = FormData();

      final requestBody = newWorkshop.toJson();
      requestBody.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      if (imageFile != null) {
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(imageFile.path),
        ));
      }

      ///TODO: check the POST workshop API
      final response = await apiService.request(
        HttpMethod.post,
        '/api/v1/events/eventorkshop',
        formData: formData,
      );

      response.fold(
        (error) {
          throw Exception('Error creating workshop: $error');
        },
        (data) {
          print("Workshop created successfully: $data");
        },
      );
    } catch (e) {
      print("Error occurred while creating the workshop: $e");
      throw Exception('Error creating workshop: $e');
    }
  }
}
