import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mao_trailer/data/core/unauthorised_exception.dart';
import 'package:mao_trailer/data/data_source/authentication_local_data_source.dart';
import 'package:mao_trailer/data/data_source/authentication_remote_data_source.dart';
import 'package:mao_trailer/data/models/request_token_model.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImpl(this._authenticationRemoteDataSource,
      this._authenticationLocalDataSource,);

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
        .requestToken ?? '';
    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
      await _authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await _authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      if (sessionId.isNotEmpty) {
        await _authenticationLocalDataSource.saveSessionId(sessionId);
        return Right(true);
      }
      return Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorisedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _authenticationLocalDataSource.getSessionId();
    await Future.wait([
      _authenticationRemoteDataSource.deleteSession(sessionId),
      _authenticationLocalDataSource.deleteSessionId(),
    ]);
    return Right(Unit);
  }

  @override
  Future<Either<AppError, UserCredential>> signInWithGoogle() async {
    UserCredential userCredential = await _authenticationRemoteDataSource.signWithGoogle();
    return Right(userCredential);
  }
}
