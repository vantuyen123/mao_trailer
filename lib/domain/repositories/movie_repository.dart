import 'package:dartz/dartz.dart';
import 'package:mao_trailer/data/models/movie_model.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieModel>>> getTrending();
  Future<Either<AppError, List<MovieModel>>> getPopular();
  Future<Either<AppError, List<MovieModel>>> getPlaying();
  Future<Either<AppError, List<MovieModel>>> getComingSoon();
}
