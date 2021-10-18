import 'package:mao_trailer/data/core/http_client.dart';
import 'package:mao_trailer/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();

  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);

  Future<String> createSession(Map<String, dynamic> requestBody);

  Future<bool> deleteSession(String sessionId);

}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final HttpClient _client;

  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<String> createSession(Map<String, dynamic> requestBody) async {
    final response =
        await _client.post('authentication/session/new', params: requestBody);
    print(response);
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await _client.get('authentication/token/new');
    print(response);
    final requestTokenModel = RequestTokenModel.fromJson(response);
    return requestTokenModel;
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'authentication/token/validate_with_login',
      params: requestBody,
    );
    print(response);
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<bool> deleteSession(String sessionId) async {
    final response = await _client.deleteWithBody(
      'authentication/session',
      params:{
        'session_id': sessionId,
      }
    );
    return response['success'] ?? false;
  }
}
