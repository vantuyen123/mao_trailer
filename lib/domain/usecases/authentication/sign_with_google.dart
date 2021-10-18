import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/repositories/authentication_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class SignWithGoogle extends UserCaseBase<void,NoParams>{
  final AuthenticationRepository _authenticationRepository;

  SignWithGoogle(this._authenticationRepository);

  @override
  Future<Either<AppError, UserCredential>> call(NoParams params) => _authenticationRepository.signInWithGoogle();


}