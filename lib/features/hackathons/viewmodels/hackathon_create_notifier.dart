import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api_service/file_service.dart';
import '../../../core/service_provider.dart/file_service_provider.dart';
import '../models/create_hackathon_model.dart';

part 'hackathon_create_notifier.g.dart';

@riverpod
class HackathonCreateNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> createHackathon(CreateHackathonModel newHackathon, {File? imageFile}) async {
    final fileUploadService = ref.watch(fileUploadServiceProvider);

    try {
      final requestBody = newHackathon.toJson();
      FormData formData = FormData();

      requestBody.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      if (imageFile != null) {
        formData.files.add(MapEntry(
          'media',
          await MultipartFile.fromFile(imageFile.path),
        ));
      }

      final response = await fileUploadService.uploadDataWithFile(
        HttpMethodFile.post,
        '/api/v1/events/event',
        data: requestBody,
        file: imageFile,
        keyName: 'media',
      );

      response.fold(
        (error) {
          throw Exception('Error creating hackathon: $error');
        },
        (data) {
          print("Hackathon created successfully: $data");
        },
      );
    } catch (e) {
      print("Error occurred while creating the hackathon: $e");
      throw Exception('Error creating hackathon: $e');
    }
  }
}
