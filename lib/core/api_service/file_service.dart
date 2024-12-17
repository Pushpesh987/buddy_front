import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import '../server_constants/server_constants.dart';
import '../shared/shared.dart';

enum HttpMethodFile { post, put, delete }

class FileUploadService {
  final Dio _dio;
  final Shared _shared;

  FileUploadService({required Shared shared})
      : _dio = Dio(
          BaseOptions(
            baseUrl: ServerConstant.serverURL,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            followRedirects: true,
            validateStatus: (status) {
              return status != null && status < 500;
            },
          ),
        ),
        _shared = shared;

  Future<Either<String, Map<String, dynamic>>> uploadDataWithFile(
    HttpMethodFile method,
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    File? file,
    String? keyName,
  }) async {
    try {
      final token = await _shared.getAuthToken();
      final Map<String, dynamic> headers = token != null ? {'Authorization': 'Bearer $token'} : {};

      Response response;

      if (file != null) {
        FormData formData = FormData();

        data?.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });

        // Use the dynamic keyName for the file key
        formData.files.add(MapEntry(
          keyName ?? 'file', // Default to 'file' if keyName is not provided
          await MultipartFile.fromFile(file.path),
        ));

        switch (method) {
          case HttpMethodFile.post:
            response = await _dio.post(
              endpoint,
              data: formData,
              options: Options(headers: Map<String, dynamic>.from(headers)),
            );
            break;
          case HttpMethodFile.put:
            response = await _dio.put(
              endpoint,
              data: formData,
              options: Options(headers: Map<String, dynamic>.from(headers)),
            );
            break;
          case HttpMethodFile.delete:
            response = await _dio.delete(
              endpoint,
              data: formData,
              options: Options(headers: Map<String, dynamic>.from(headers)),
            );
            break;
          default:
            return Left('Unsupported method for FormData');
        }
      } else {
        switch (method) {
          case HttpMethodFile.post:
            response = await _dio.post(
              endpoint,
              data: data ?? {},
              queryParameters: queryParameters,
              options: Options(headers: Map<String, dynamic>.from(headers)),
            );
            break;
          case HttpMethodFile.put:
            response = await _dio.put(
              endpoint,
              data: data ?? {},
              queryParameters: queryParameters,
              options: Options(headers: Map<String, dynamic>.from(headers)),
            );
            break;
          case HttpMethodFile.delete:
            response = await _dio.delete(
              endpoint,
              data: data ?? {},
              queryParameters: queryParameters,
              options: Options(headers: Map<String, dynamic>.from(headers)),
            );
            break;
          default:
            return Left('Unsupported method for JSON data');
        }
      }

      if (response.data is Map<String, dynamic>) {
        return Right(Map<String, dynamic>.from(response.data));
      } else {
        return Left('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          return Left('Dio error: ${e.response?.statusCode} - ${e.response?.data}');
        } else {
          return Left('Dio error: ${e.message}');
        }
      } else {
        return Left('Unknown error occurred: $e');
      }
    }
  }
}
