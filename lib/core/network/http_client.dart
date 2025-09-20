abstract class HttpClient {
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    required HttpResponse Function(Map<String, dynamic>?) onConvert,
  });
}

abstract class HttpResponse<T> {
  T toResponse(Map<String, dynamic>? queryParameters);
}
