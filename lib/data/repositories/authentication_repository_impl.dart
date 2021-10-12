import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mao_trailer/data/core/unauthorised_exception.dart';
import 'package:mao_trailer/data/data_source/authentication_remote_data_source.dart';
import 'package:mao_trailer/data/models/request_token_model.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource);

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final response = await _authenticationRemoteDataSource.getRequestToken();
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token1 = requestTokenEitherResponse
            .getOrElse(() => RequestTokenModel())
            .requestToken ??
        '';
    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await _authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await _authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());

      print(sessionId);
      return Right(true);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
