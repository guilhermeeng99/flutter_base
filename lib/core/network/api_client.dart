import 'package:dio/dio.dart';
import 'package:flutter_base/core/network/api_endpoints.dart';
import 'package:logger/logger.dart';

class ApiClient {
  ApiClient() : _dio = Dio(_baseOptions) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d(
            'RESPONSE[${response.statusCode}] => PATH: '
            '${response.requestOptions.path}',
          );
          handler.next(response);
        },
        onError: (error, handler) {
          _logger.e(
            'ERROR[${error.response?.statusCode}] => '
            'PATH: ${error.requestOptions.path}',
          );
          handler.next(error);
        },
      ),
    );
  }

  final Dio _dio;
  final Logger _logger = Logger();

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  );

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
  }) {
    return _dio.post(path, data: data);
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
  }) {
    return _dio.put(path, data: data);
  }
}
