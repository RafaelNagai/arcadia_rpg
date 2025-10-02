import 'package:arcadia_rpg/core/network/http_client.dart';
import 'package:dio/dio.dart';

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
}
