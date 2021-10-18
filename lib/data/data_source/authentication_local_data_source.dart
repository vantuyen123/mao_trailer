import 'package:hive/hive.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
  Future<String> getSessionId();
  Future<void> deleteSessionId();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    print('save session -local');
    print('save session $sessionId');
    final authenticationBox = await Hive.openBox('authenticationBox');
    return await authenticationBox.put('session_id', sessionId);
  }

  @override
  Future<void> deleteSessionId() async {
    print('delete session - local');
    final authenticationBox = await Hive.openBox('authenticationBox');
    authenticationBox.delete('session_id');
  }

  @override
  Future<String> getSessionId() async {
    final authenticationBox = await Hive.openBox('authenticationBox');
    print('get sessionId ${await authenticationBox.get('session_id')}');
    return await authenticationBox.get('session_id');
  }
}
