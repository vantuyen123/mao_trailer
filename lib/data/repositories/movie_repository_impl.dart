import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mao_trailer/data/data_source/movie_remote_data_source.dart';
import 'package:mao_trailer/data/models/movie_model.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError,List<MovieModel>>> getTrending() async{
    try{
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException{
      return Left(AppError(AppErrorType.network));
    } on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try{
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException  {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlaying() async {
    try{
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try{
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

}