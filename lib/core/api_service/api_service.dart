import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fpdart/fpdart.dart';

import '../server_constants/server_constants.dart';

enum HttpMethod { get, post, put, delete }

class ApiService {
  final Dio _dio;

  ApiService()
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
        );

  Future<Either<String, Map<String, dynamic>>> request(
    HttpMethod method,
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response;

      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            endpoint,
            queryParameters: queryParameters,
          );
          break;
        case HttpMethod.post:
          response = await _dio.post(
            endpoint,
            data: json.encode(data),
          );
          break;
        case HttpMethod.put:
          response = await _dio.put(
            endpoint,
            data: json.encode(data),
          );
          break;
        case HttpMethod.delete:
          response = await _dio.delete(
            endpoint,
            data: json.encode(data),
          );
          break;
      }

      return Right(response.data);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }
}
