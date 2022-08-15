import 'package:dio/dio.dart';
import 'package:machine_test/app/data/endpoints.dart';

class DioClient {
  static BaseOptions options = BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: Endpoints.connectionTimeout,
    receiveTimeout: Endpoints.receiveTimeout,
  );
  final Dio _dio = Dio(options);

  Future<dynamic> get(
    String uri, {
    required Map<String, dynamic> queryParameters,
    // required Options options,
    // required CancelToken cancelToken,
    required ProgressCallback onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        // options: options,
        // cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    required Map<String, dynamic> queryParameters,
    // required Options options,
    // required CancelToken cancelToken,
    required ProgressCallback onSendProgress,
    required ProgressCallback onReceiveProgress,
  }) async {
    final Response response = await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      // options: options,
      // cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response.data;
  }
}
