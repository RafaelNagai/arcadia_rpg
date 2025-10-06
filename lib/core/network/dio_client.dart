import 'package:arcadia_rpg/core/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<HttpClient>((ref) {
  return DioClient(
    baseUrl: 'https://international-dasha-arcadia-rpg-4231dd2b.koyeb.app/api',
  );
});

class DioClient implements HttpClient {
  final Dio _dio;

  DioClient({required String baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
        ),
      ) {
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    required HttpResponse Function(Map<String, dynamic>? p1) onConvert,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return onConvert(response as Map<String, dynamic>);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> post(
    String path, {
    dynamic data,
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  }) async {
    try {
      final response = await _dio.post(path, data: data);
      return onConvert(response.data as Map<String, dynamic>);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> put(
    String path, {
    dynamic data,
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  }) async {
    try {
      final response = await _dio.put(path, data: data);
      return onConvert(response.data as Map<String, dynamic>);
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> delete(
    String path, {
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  }) async {
    try {
      final response = await _dio.delete(path);
      return onConvert(response.data as Map<String, dynamic>);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
