abstract class HttpClient {
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  });
  Future<HttpResponse> post(
    String path, {
    dynamic data,
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  });

  Future<HttpResponse> put(
    String path, {
    dynamic data,
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  });

  Future<HttpResponse> delete(
    String path, {
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  });
}

abstract class HttpResponse<T> {
  T toResponse();
}
