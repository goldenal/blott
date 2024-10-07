import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiCall {
  static ApiCall _instance = ApiCall._internal();
  late Dio _dio;

  ApiCall._internal([String? authToken = '']) {
    _dio = Dio();

    _dio.options.baseUrl = "https://finnhub.io/api/v1/";
    _dio.options.connectTimeout = const Duration(seconds: 30);
    // _dio.options.receiveTimeout = const Duration(seconds: 30);
    // _dio.options.responseType = ResponseType.json;
    _dio.options.contentType = "";
    _dio.options.headers = {
      'Content-Type': 'application/json; charset=utf-8',
      "Accept": "*/*",
      "X-Finnhub-Token": "crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg",
    };
    if (!kReleaseMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: !kReleaseMode,
        responseHeader: true,
        responseBody: !kReleaseMode,
      ));
    }
  }
  static ApiCall getInstance() {
    return _instance;
  }

  Future<Response> postReq(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data ?? formData,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getReq(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
