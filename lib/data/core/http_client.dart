import 'dart:convert';

import 'package:http/http.dart';
import 'package:mao_trailer/data/core/unauthorised_exception.dart';

import 'api_constants.dart';

class HttpClient {
  final Client _client;

  HttpClient(this._client);

  //Get:------------------------------------------------------------------------
  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
        Uri.parse(getPath(path, params)),
        headers: {
          'Content-Type': 'application/json'
        }
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(Uri.parse(getPath(path, params)),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json'
      },
    );
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else if(response.statusCode == 401){
      throw UnauthorisedException();
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants
        .API_KEY}$paramsString';
  }

  dynamic deleteWithBody(String path,{Map<dynamic,dynamic> params}) async{
    Request request = Request('DELETE',Uri.parse(s))
  }
}