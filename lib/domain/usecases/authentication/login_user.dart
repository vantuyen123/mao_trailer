import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/login_request_params.dart';
import 'package:mao_trailer/domain/repositories/authentication_repository.dart';

import '../use_case_base.dart';

class LoginUser extends UserCaseBase<bool,LoginRequestParams>{
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) =>
      _authenticationRepository.loginUser(params.toJson());

}