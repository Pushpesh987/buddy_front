import 'package:dio/dio.dart';
import 'dart:convert';
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
              return status != null && (status < 500);
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

      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            endpoint,
            queryParameters: queryParameters,
            options: Options(headers: Map<String, dynamic>.from(headers)),
          );
          break;
        case HttpMethod.post:
          response = await _dio.post(
            endpoint,
            data: json.encode(data),
            options: Options(headers: Map<String, dynamic>.from(headers)),
          );
          break;
        case HttpMethod.put:
          response = await _dio.put(
            endpoint,
            data: json.encode(data),
            options: Options(headers: Map<String, dynamic>.from(headers)),
          );
          break;
        case HttpMethod.delete:
          response = await _dio.delete(
            endpoint,
            data: json.encode(data),
            options: Options(headers: Map<String, dynamic>.from(headers)),
          );
          break;
      }

      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);
        return Right(responseData);
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
