import 'package:dio/dio.dart';
import 'package:mao_trailer/data/core/api_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  //Get: -----------------------------------------------------------------------
  dynamic get(
    String path, {
    Map<dynamic, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        getPath(path, params),
        options: Options(
          headers: {'Content-Type': 'Application/json'},
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return print('Error get Api: ${response.statusCode}');
      }
    } catch (e) {
      print('Error get Api:' + e.toString());
      throw e;
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
