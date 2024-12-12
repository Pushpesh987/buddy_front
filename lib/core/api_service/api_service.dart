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
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
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

      final Map<String, dynamic> responseData = Map<String, dynamic>.from(response.data);

      return Right(responseData);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }
}
