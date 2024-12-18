import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../server_constants/server_constants.dart';
import '../shared/shared.dart';

enum HttpMethod { get, post, put, delete }

class ApiService {
  final Dio _dio;
  final Shared _shared;

  ApiService({required Shared shared})
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

  Future<Either<String, Map<String, dynamic>>> request(
    HttpMethod method,
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final token = await _shared.getAuthToken();
      final Map<String, dynamic> headers = token != null ? {'Authorization': 'Bearer $token'} : {};

      Response response;

      // Handle JSON requests (POST, PUT, DELETE, GET)
      final jsonData = data != null ? json.encode(data) : null;

      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            endpoint,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
              contentType: Headers.jsonContentType, // Ensures JSON is sent
            ),
          );
          break;
        case HttpMethod.post:
          response = await _dio.post(
            endpoint,
            data: jsonData,
            options: Options(
              headers: headers,
              contentType: Headers.jsonContentType, // Ensures JSON is sent
            ),
          );
          break;
        case HttpMethod.put:
          response = await _dio.put(
            endpoint,
            data: jsonData,
            options: Options(
              headers: headers,
              contentType: Headers.jsonContentType, // Ensures JSON is sent
            ),
          );
          break;
        case HttpMethod.delete:
          response = await _dio.delete(
            endpoint,
            data: jsonData,
            options: Options(
              headers: headers,
              contentType: Headers.jsonContentType, // Ensures JSON is sent
            ),
          );
          break;
        default:
          return Left('Unsupported HTTP method');
      }

      // Ensure that the response data is a Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        return Right(Map<String, dynamic>.from(response.data));
      } else {
        return Left('Unexpected response format: ${response.data}');
      }
    } catch (e) {
      // Error handling
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
