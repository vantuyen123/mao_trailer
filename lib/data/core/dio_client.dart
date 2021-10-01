import 'package:dio/dio.dart';
import 'package:mao_trailer/data/core/api_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  //Get: -----------------------------------------------------------------------
  dynamic get(String path, {Map<dynamic,dynamic>? params}) async {
    final response = await _dio.get(
      getPath(path, params),
      options: Options(
        headers: {'Content-Type': 'Application/json'},
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  String getPath(String path,Map<dynamic,dynamic>? params){
    var paramsString = '';
    if(params?.isEmpty ?? false){
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}
