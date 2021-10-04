import 'package:dio/dio.dart';
import 'package:mao_trailer/data/core/api_constants.dart';

abstract class NetworkModule{
  /// A single dio provider
  ///
  /// Calling it multiple time will return the same instance.

  static Dio provideDio(){
    final dio = Dio();

    dio
    ..options.baseUrl = ApiConstants.BASE_URL
    .. options.connectTimeout = ApiConstants.connectionTimeOut
    ..options.receiveTimeout = ApiConstants.receiveTimeOut
    ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
    ..interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestHeader: true,
      requestBody: true
    ));

    return dio;
  }
}